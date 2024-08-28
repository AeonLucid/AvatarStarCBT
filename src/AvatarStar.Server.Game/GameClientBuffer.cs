namespace AvatarStar.Server.Game;

public class GameClientBuffer : ClientBuffer
{
    public GameClientBuffer() : base(2, false)
    {
    }

    protected override int ReadPacketSize(Span<byte> buffer, ref int packetSizeLen)
    {
        var more = true;
        var value = 0;
        var shift = 0;
        
        while (more)
        {
            // Check if buffer is too small
            if (shift > 21)
            {
                return -1;
            }
            
            if (packetSizeLen >= buffer.Length)
            {
                return 0;
            }
            var lower7bits = buffer[packetSizeLen++];
            more = (lower7bits & 128) != 0;
            value |= (lower7bits & 0x7f) << shift;
            shift += 7;
        }
        
        return value;
    }
}