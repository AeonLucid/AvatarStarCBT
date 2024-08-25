using System.Buffers;
using System.Buffers.Binary;
using System.Text;

namespace AvatarStar.Server.Login;

public class PacketWriter : IDisposable
{
    private readonly byte[] _data;
    private int _pos;

    public PacketWriter(byte packetId)
    {
        _data = ArrayPool<byte>.Shared.Rent(1024);
        _pos = 0;

        WriteShort(0); // Reserve space for packet size
        WriteByte(packetId); // Write packet id
    }

    public void WriteBool(bool value)
    {
        _data[_pos++] = value ? (byte)1 : (byte)0;
    }

    public void WriteByte(byte value)
    {
        _data[_pos++] = value;
    }

    public void WriteShort(short value)
    {
        BinaryPrimitives.WriteInt16LittleEndian(_data.AsSpan(_pos), value);
        _pos += 2;
    }

    public void WriteInt(int value)
    {
        BinaryPrimitives.WriteInt32LittleEndian(_data.AsSpan(_pos), value);
        _pos += 4;
    }

    public void WriteLong(long value)
    {
        BinaryPrimitives.WriteInt64LittleEndian(_data.AsSpan(_pos), value);
        _pos += 8;
    }

    public void WriteBytes(byte[] value)
    {
        WriteInt(value.Length);
        Array.Copy(value, 0, _data, _pos, value.Length);
        _pos += value.Length;
    }

    public void WriteString(string value)
    {
        WriteBytes(Encoding.UTF8.GetBytes(value));
    }
    
    public byte[] GetData()
    {
        BinaryPrimitives.WriteInt16LittleEndian(_data.AsSpan(0), (short)_pos);
        return _data.AsSpan(0, _pos).ToArray();
    }

    public void Dispose()
    {
        ArrayPool<byte>.Shared.Return(_data);
    }
}