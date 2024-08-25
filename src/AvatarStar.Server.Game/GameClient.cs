using System.Net.Sockets;
using Serilog;

namespace AvatarStar.Server.Game;

public class GameClient : Client
{
    public GameClient(ClientHandler clientHandler, Socket socket) : base(clientHandler, socket)
    {
    }

    protected override Task HandleAsync(PacketReader reader)
    {
        Log.Debug("Handling packet");
        
        // Check for remaining data
        if (reader.Remaining > 0)
        {
            Log.Warning("Packet has {Remaining} bytes remaining", reader.Remaining);
        }
        
        return Task.CompletedTask;
    }

    protected override ClientBuffer CreateBuffer()
    {
        return new ClientBuffer(minPacketLength: 1, packetLengthSize: 1);
    }
}