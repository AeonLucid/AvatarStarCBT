namespace AvatarStar.Server.Utilities;

public class VLE
{
    public static int Encode(int value, Span<byte> destination)
    {
        var pos = 0;
        
        do
        {
            byte lower7bits = (byte)(value & 0x7f);
            value >>= 7;
            if (value > 0)
                lower7bits |= 128;
            destination[pos++] = lower7bits;
        } while (value > 0);
        
        return pos;
    }
}