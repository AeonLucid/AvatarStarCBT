using System.Buffers.Binary;
using System.Text;

namespace AvatarStar.Server.Login;

public class PacketReader
{
    private readonly byte[] _data;
    private int _position;
    
    public PacketReader(byte[] data)
    {
        _data = data;
        _position = 0;
    }

    public int Remaining => _data.Length - _position;

    public bool ReadBool()
    {
        return _data[_position++] == 1;
    }
    
    public byte ReadByte()
    {
        return _data[_position++];
    }
    
    public short ReadShort()
    {
        var value = BinaryPrimitives.ReadInt16LittleEndian(_data.AsSpan(_position));
        _position += 2;
        return value;
    }
    
    public int ReadInt()
    {
        var value = BinaryPrimitives.ReadInt32LittleEndian(_data.AsSpan(_position));
        _position += 4;
        return value;
    }
    
    public long ReadLong()
    {
        var value = BinaryPrimitives.ReadInt64LittleEndian(_data.AsSpan(_position));
        _position += 8;
        return value;
    }
    
    public string ReadString()
    {
        var length = ReadInt();
        var value = Encoding.UTF8.GetString(_data, _position, length);
        _position += length;
        return value;
    }

    public byte[] ReadBytes()
    {
        var length = ReadInt();
        var value = _data.AsSpan(_position, length).ToArray();
        _position += length;
        return value;
    }
}