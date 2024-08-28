using System.Buffers.Binary;

namespace AvatarStar.Server.Login;

public class LoginClientBuffer : ClientBuffer
{
    public LoginClientBuffer() : base(minBufferSize: 3, true)
    {
    }

    protected override int ReadPacketSize(Span<byte> buffer, out int packetSizeLen)
    {
        packetSizeLen = sizeof(short);
        return BinaryPrimitives.ReadInt16LittleEndian(buffer);
    }
}