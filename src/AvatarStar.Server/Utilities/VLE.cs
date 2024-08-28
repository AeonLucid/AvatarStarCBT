namespace AvatarStar.Server.Utilities;

public static class VLE
{
    public static int Encode(int value, Span<byte> destination)
    {
        var pos = 0;
        
        do
        {
            var lower7bits = (byte)(value & 0x7f);
            value >>= 7;
            if (value > 0)
            {
                lower7bits |= 128;
            }
            destination[pos++] = lower7bits;
        } while (value > 0);
        
        return pos;
    }

    public static int Decode(Span<byte> buffer, out int varLen)
    {
        varLen = 0;
        
        var more = true;
        var value = 0;
        var shift = 0;
        
        while (more)
        {
            if (varLen >= buffer.Length)
            {
                return 0;
            }
            
            var lower7bits = buffer[varLen++];
            more = (lower7bits & 128) != 0;
            value |= (lower7bits & 0x7f) << shift;
            shift += 7;
        }
        
        return value;
    }
}