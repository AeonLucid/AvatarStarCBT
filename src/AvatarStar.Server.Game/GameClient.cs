using System.Buffers;
using System.Drawing;
using System.Net.Sockets;
using AvatarStar.Server.Utilities;
using Luaon.Json;
using Newtonsoft.Json;
using Serilog;

namespace AvatarStar.Server.Game;

public class GameClient : Client
{
    private int _lobbyState;
    
    public GameClient(ClientHandler clientHandler, Socket socket) : base(clientHandler, socket)
    {
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
                    writer = new PacketWriter();
                    writer.WriteByte(0); // packetId
                    writer.WriteInt(rpcId);

                    // var testCount = 1;
                    var testOffset = (rpcId * 0.01f);
                    
                    var suitList = LuaSerializer.Serialize(new object[]
                    {
                        new
                        {
                            avatar = new
                            {
                                avatarId = int.Parse(rpcArgs["sysCharacterId"]),
                                // skin = "{{'skin',1,-1,1,255,255,255,0,0,0,0,0,0}}",
                                // hair = "{{'hair',1,0,1,255,255,255,0,0,0,0,0,0}}",
                                // eye = "{{'eye',1,0,1,255,255,255,0,0,0,0,0,0}}",
                                // mouth = "{{'mouth',1,0,1,255,255,255,0,0,0,0,0,0}}",
                                // immobileDown = "{}",
                                // eye = 1,
                                // mouth = 1,
                                // immobileDown = 1,
                                // eye = 1,
                                // mouth = 1,
                                // nose = 1,
                                // ear = 1,
                                // beard = 1,
                                // hair = 1,
                                // helmet = 1,
                                // underwear = 1,
                                // outerwear = 1,
                                // trousers = 1,
                                // glove = 1,
                                // shoes = 1,
                                // decal = 1,
                                // movable = 1,
                                // immobile = 1,
                                // immobileUp = 1,
                                // immobileDown = 1
                            },
                            part = new object[]
                            {
                                // hair
                                // femalecommandos01_hair_lod0
                                new
                                {
                                    partId = 7,
                                    value = "{'guardman_hair_lod0',7,0,1,83,227,227,0,0,0,0,0,0}",
                                },
                                
                                new
                                {
                                    partId = 7,
                                    value = "{'guardmans_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'guardman02_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'guardman01_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'guardman_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                
                                new
                                {
                                    partId = 7,
                                    value = "{'airforce_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'atongmu_hair',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'bashenan_hair',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'bocheheinie_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'bomber_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'brs_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'cavalier_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'chaoren_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'dahuangfeng_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'demonhunter_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'femalecommandos01_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'femalecommandos02_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'guardwoman02_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'guardwomanss_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 7,
                                    value = "{'guardwomans_hair_lod0',7,0,1,100,255,255,0,0,0,0,0,0}",
                                },
                                new
                                {
                                    partId = 2,
                                    value = LuaMethods.GetEyeInfo( 
                                            texResName: "guardman_eye", 
                                            
                                            leftTranslateX: 0.17f, 
                                            leftTranslateY: -0.1f - testOffset, 
                                            leftTheta: 0.1f, 
                                            leftScaleX: 1f, 
                                            leftScaleY: 1f,
                                            
                                            rightTranslateX: -0.17f, 
                                            rightTranslateY: -0.1f - testOffset, 
                                            rightTheta: -0.1f, 
                                            rightScaleX: 1f, 
                                            rightScaleY: 1f,
                                            
                                            colors: [/* Eyebrow */ Color.Black, /* Eyelash */ Color.Black, /* Pupil */ Color.FromArgb(0, 110, 166)])
                                },
                                new
                                {
                                    // mouth
                                    partId = 3,
                                    value = LuaMethods.GetFaceAnimInfo("one_mouth", 3, 0.0f, 0.0f, 0f, 1.75f, 1.0f, [Color.Black, Color.Black, Color.Black])
                                },
                                new
                                {
                                    // mouth
                                    partId = 3,
                                    value = LuaMethods.GetFaceAnimInfo("guardman_mouth", 3, 0.0f, 0.0f, 0f, 1.0f, 1.0f, [Color.Black])
                                },
                                new
                                {
                                    // immobileDown (trinket)
                                    // string.format("{'%s',%d,%d,%s}", data.res_name, data.part_id, data.index_in_layer, GetChannelInfoStr(data))
                                    // 0 = /mesh/character/thirdperson/avatar/mesh_femalecommandossss_trinket.mesh
                                    // 1 = /mesh/character/thirdperson/avatar/skin/mesh_femalecommandossss_trinket.mesh
                                    // 2 = /mesh/character/thirdperson/avatar/head/eye/mesh_femalecommandossss_trinket.mesh
                                    // 3 = /mesh/character/thirdperson/avatar/head/mouth/mesh_femalecommandossss_trinket.mesh
                                    // 4 = /mesh/character/thirdperson/avatar/head/nose/mesh_femalecommandossss_trinket.mesh
                                    // 5 = /mesh/character/thirdperson/avatar/head/ear/mesh_femalecommandossss_trinket.mesh
                                    // 6 = /mesh/character/thirdperson/avatar/head/beard/mesh_femalecommandossss_trinket.mesh
                                    // 7 = /mesh/character/thirdperson/avatar/head/hair/mesh_femalecommandossss_trinket.mesh
                                    // 8 = /mesh/character/thirdperson/avatar/head/helmet/mesh_femalecommandossss_trinket.mesh
                                    // 9 = /mesh/character/thirdperson/avatar/dress/underwear/mesh_femalecommandossss_trinket.mesh
                                    // 10 = /mesh/character/thirdperson/avatar/dress/outerwear/mesh_femalecommandossss_trinket.mesh
                                    // 11 = /mesh/character/thirdperson/avatar/dress/trousers/mesh_femalecommandossss_trinket.mesh
                                    // 12 = /mesh/character/thirdperson/avatar/dress/glove/mesh_femalecommandossss_trinket.mesh
                                    // 13 = /mesh/character/thirdperson/avatar/dress/shoes/mesh_femalecommandossss_trinket.mesh
                                    // 14 = /mesh/character/thirdperson/avatar/decal/mesh_femalecommandossss_trinket.mesh
                                    // 15 = /mesh/character/thirdperson/avatar/trinket/movable/mesh_femalecommandossss_trinket.mesh
                                    // 16 = /mesh/character/thirdperson/avatar/trinket/aboveneck/mesh_femalecommandossss_trinket.mesh
                                    // 17 = /mesh/character/thirdperson/avatar/trinket/upperbody/mesh_femalecommandossss_trinket.mesh
                                    // 18 = /mesh/character/thirdperson/avatar/trinket/lowerbody/mesh_femalecommandossss_trinket.mesh
                                    // 19 = /mesh/character/thirdperson/avatar/wingsmesh_femalecommandossss_trinket.mesh
                                    // 20 = /mesh/character/thirdperson/avatar/left_ringmesh_femalecommandossss_trinket.mesh
                                    // 21 = /mesh/character/thirdperson/avatar/right_ringmesh_femalecommandossss_trinket.mesh
                                    // 22 = /mesh/character/thirdperson/avatar/badgemesh_femalecommandossss_trinket.mesh
                                    // 23 = /mesh/character/thirdperson/avatar/mesh_femalecommandossss_trinket.mesh
                                    // 24 = /mesh/character/thirdperson/avatar//animation/character/thirdperson/mesh_femalecommandossss_trinket.mesh
                                    // 25 = /mesh/character/thirdperson/avatar/animsetmesh_femalecommandossss_trinket.mesh
                                    partId = 18,
                                    value = "{{'femalecommandossss01_trinket_lod0',18,1,1,100,100,100,0,0,0,0,0,0}}",
                                }
                            }
                        }
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