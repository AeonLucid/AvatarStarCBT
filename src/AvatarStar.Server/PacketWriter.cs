using System.Buffers;
using System.Buffers.Binary;
using System.Text;

namespace AvatarStar.Server;

public class PacketWriter : IDisposable
{
    private byte[] _data;
    private int _pos;

    public PacketWriter()
    {
        _data = ArrayPool<byte>.Shared.Rent(1024);
        _pos = 0;
    }

    public void WriteBool(bool value)
    {
        EnsureCapacity(sizeof(bool));
        _data[_pos++] = value ? (byte)1 : (byte)0;
    }

    public void WriteByte(byte value)
    {
        EnsureCapacity(sizeof(byte));
        _data[_pos++] = value;
    }

    public void WriteShort(short value)
    {
        EnsureCapacity(sizeof(short));
        BinaryPrimitives.WriteInt16LittleEndian(_data.AsSpan(_pos), value);
        _pos += sizeof(short);
    }

    public void WriteInt(int value)
    {
        EnsureCapacity(sizeof(int));
        BinaryPrimitives.WriteInt32LittleEndian(_data.AsSpan(_pos), value);
        _pos += sizeof(int);
    }

    public void WriteLong(long value)
    {
        EnsureCapacity(sizeof(long));
        BinaryPrimitives.WriteInt64LittleEndian(_data.AsSpan(_pos), value);
        _pos += sizeof(long);
    }

    public void WriteBytes(byte[] value)
    {
        WriteInt(value.Length);
        
        EnsureCapacity(value.Length);
        Array.Copy(value, 0, _data, _pos, value.Length);
        _pos += value.Length;
    }

    public void WriteString(string value)
    {
        WriteBytes(Encoding.UTF8.GetBytes(value));
    }
    
    private void EnsureCapacity(int length)
    {
        if (_pos + length > _data.Length)
        {
            var dataLen = Math.Max(_pos + length + 1024, _data.Length * 2);
            var data = ArrayPool<byte>.Shared.Rent(dataLen);
            
            Array.Copy(_data, data, _pos);
            ArrayPool<byte>.Shared.Return(_data);
            
            _data = data;
        }
    }
    
    public byte[] ToBuffer()
    {
        return _data.AsSpan(0, _pos).ToArray();
    }

    public void Dispose()
    {
        ArrayPool<byte>.Shared.Return(_data);
    }
}