using System.Buffers;
using System.Net.Sockets;
using AvatarStar.Server.Game.Config;
using AvatarStar.Server.Game.Rpc;
using AvatarStar.Server.Utilities;
using Microsoft.Extensions.Options;
using Serilog;

namespace AvatarStar.Server.Game;

public class GameClient : Client
{
    private readonly IOptionsMonitor<AvatarSelectionConfig> _avatarSelectionMonitor;
    
    private int _lobbyState;
    
    public GameClient(ClientHandler clientHandler, Socket socket, IOptionsMonitor<AvatarSelectionConfig> avatarSelectionMonitor) : base(clientHandler, socket)
    {
        _avatarSelectionMonitor = avatarSelectionMonitor;
        _lobbyState = 1;
    }

    protected override async Task HandleAsync(PacketReader reader)
    {
        switch (_lobbyState)
        {
            case 1:
            {
                await HandleStateConnecting(reader);
                break;
            }

            case 2:
            {
                await HandleStateAvatarSelection(reader);
                break;
            }

            default:
            {
                Log.Error("Unhandled lobby state {LobbyState}", _lobbyState);
                break;
            }
        }
        
        // Check for remaining data
        if (reader.Remaining > 0)
        {
            Log.Warning("Packet has {Remaining} bytes remaining", reader.Remaining);
        }
    }

    private async Task HandleStateConnecting(PacketReader reader)
    {
        Log.Debug("Handling initial packet with payload length {PacketLen}", reader.Remaining);

        _lobbyState = 2;

        var clientVersion = reader.ReadString();
        
        if (reader.ReadByte() == 1)
        {
            var authToken = reader.ReadString();
        }
        else
        {
            var authUk1 = reader.ReadString();
            var authUk2 = reader.ReadString();
        }

        var packet = new PacketWriter();
                
        // DWORD
        packet.WriteInt(1);
                
        // QWORD?
        packet.WriteInt(1);
        packet.WriteInt(1);
                
        // String.
        packet.WriteString("Aeon");

        await SendAsync(packet);
    }

    private async Task HandleStateAvatarSelection(PacketReader reader)
    {
        Log.Debug("Handling avatar selection packet with payload length {PacketLen}", reader.Remaining);

        var packetId = reader.ReadByte();

        switch (packetId)
        {
            // rpc call?
            case 0:
            {
                var rpcId = reader.ReadInt(); // 0x800034
                var rpcName = reader.ReadString(); // From lua (player_list)
                var rpcArgs = new Dictionary<string, string>();

                while (true)
                {
                    var key = reader.ReadString();
                    if (key == string.Empty) break;
                    
                    var value = reader.ReadString();
                    
                    rpcArgs.Add(key, value);
                }
                
                Log.Debug("AvatarSelection[{Pid}] rpcId={RpcId} rpcName={RpcName} rpcArgs={RpcArgs}", packetId, rpcId, rpcName, rpcArgs);
                
                var writer = new PacketWriter();
                writer.WriteByte(0); // packetId
                writer.WriteInt(rpcId);

                if (rpcName == "player_list")
                {
                    var characters = LuaSerializer.Serialize(new object[]
                    {
                        // new
                        // {
                        //     id = 3,
                        //     name = "Test",
                        //     level = 5,
                        //     occupation = 1,
                        //     battleForce = "battleForce",
                        //     equips = (object?)null,
                        //     equipAvatar = new
                        //     {
                        //         skin = 0,
                        //         eye = 0,
                        //         mouth = 0,
                        //         nose = 0,
                        //         ear = 0,
                        //         beard = 0,
                        //         hair = 0,
                        //         helmet = 0,
                        //         underwear = 0,
                        //         outerwear = 0,
                        //         trousers = 0,
                        //         glove = 0,
                        //         shoes = 0,
                        //         decal = 0,
                        //         movable = 0,
                        //         immobile = 0,
                        //         immobileUp = 0,
                        //         immobileDown = 0
                        //     }
                        // }
                    });
                        
                    writer.WriteString("cost = 1\n" +
                                       "characters = " + characters + "\n" +
                                       "lastPid = 0");
                    
                    await SendAsync(writer);
                } 
                else if (rpcName == "sysavatar_list")
                {
                    var config = _avatarSelectionMonitor.CurrentValue;
                    var configAvatarId = int.Parse(rpcArgs["sysCharacterId"]);
                    var configAvatar = config.SysCharacters[configAvatarId];
                    
                    var suitList = LuaSerializer.Serialize(new[]
                    {
                        SysAvatarListResponse.SuitList.FromConfig(configAvatarId, configAvatar.Male),
                        SysAvatarListResponse.SuitList.FromConfig(configAvatarId, configAvatar.Female),
                    });
                    
                    var weapons = LuaSerializer.Serialize(new object[]
                    {
                        new
                        {
                            subType = "subtype1",
                            resource = "badge01"
                        },
                        new
                        {
                            subType = "subtype2",
                            resource = "badge02"
                        },
                        new
                        {
                            subType = "subtype3",
                            resource = "badge04"
                        }
                    });
                    
                    writer.WriteString($"sysAvatar = {suitList}\n" +
                                       $"weapons = {weapons}");
                    
                    await SendAsync(writer);
                }
                
                break;
            }
        }
    }

    protected override ClientBuffer CreateBuffer()
    {
        return new GameClientBuffer();
    }

    protected override async Task SendAsync(ArraySegment<byte> data)
    {
        const int MaxLengthSize = 3;
        
        var bufferLen = data.Count + MaxLengthSize;
        var buffer = ArrayPool<byte>.Shared.Rent(bufferLen);
        
        try
        {
            // Write packet length.
            var packetLengthSize = VLE.Encode(data.Count, buffer.AsSpan());
            if (packetLengthSize > MaxLengthSize)
            {
                throw new InvalidOperationException("Packet length is too large");
            }
            
            var bufferLenActual = packetLengthSize + data.Count;
            
            // Write payload.
            data.CopyTo(new ArraySegment<byte>(buffer, packetLengthSize, data.Count));
            
            await base.SendAsync(new ArraySegment<byte>(buffer, 0, bufferLenActual));
        }
        finally
        {
            ArrayPool<byte>.Shared.Return(buffer);
        }
    }
}