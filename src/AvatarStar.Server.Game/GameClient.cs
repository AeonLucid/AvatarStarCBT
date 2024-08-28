using System.Buffers;
using System.Buffers.Binary;
using System.Net.Sockets;
using AvatarStar.Server.Utilities;
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
                Log.Debug("Handling initial packet with payload length {PacketLen}", reader.Remaining);

                _lobbyState = 2;

                var clientVersion = reader.ReadString();
                var clientUk = reader.ReadByte();
                var authToken = reader.ReadString();
                
                var packet = new PacketWriter();
                
                // DWORD
                packet.WriteInt(1);
                
                // QWORD?
                packet.WriteInt(1);
                packet.WriteInt(1);
                
                // String.
                packet.WriteString("Aeon");

                await SendAsync(packet);
                break;
            }

            case 2:
            {
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