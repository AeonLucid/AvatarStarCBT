using AvatarStar.Server.Utilities;

namespace AvatarStar.Server.Game;

public class GameClientBuffer : ClientBuffer
{
    private const int MaxPacketSizeByteCount = 3;
    
    public GameClientBuffer() : base(2, false)
    {
    }

    protected override int ReadPacketSize(Span<byte> buffer, out int packetSizeLen)
    {
        var value = VLE.Decode(buffer, out packetSizeLen);

        // Packet sizes are limited to 3 bytes.
        if (packetSizeLen > MaxPacketSizeByteCount)
        {
            return -1;
        }
        
        return value;
    }
}