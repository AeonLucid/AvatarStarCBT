using System.Buffers;
using System.Buffers.Binary;

namespace AvatarStar.Server.Launcher;

public class ClientBuffer : IDisposable
{
    private const int BufferSize = 4096;
    private const int MinimalPacketSize = 3;
    
    private IMemoryOwner<byte> _buffer;
    private int _bufferLen;
    
    public ClientBuffer()
    {
        _buffer = MemoryPool<byte>.Shared.Rent(BufferSize);
        _bufferLen = 0;
    }
    
    public void Append(Memory<byte> data)
    {
        // Check if fits in buffer, if not grow the buffer
        if (_bufferLen + data.Length > _buffer.Memory.Length)
        {
            var newBuffer = MemoryPool<byte>.Shared.Rent(_buffer.Memory.Length + data.Length);
            _buffer.Memory.CopyTo(newBuffer.Memory);
            _buffer.Dispose();
            _buffer = newBuffer;
        }
        
        // Copy data to buffer
        data.CopyTo(_buffer.Memory.Slice(_bufferLen));
        
        // Update buffer length
        _bufferLen += data.Length;
    }

    public List<PacketReader> Process()
    {
        var packets = new List<PacketReader>();
        var bufferPos = 0;
        
        // Read packets from buffer
        while (_bufferLen - bufferPos >= MinimalPacketSize)
        {
            var packetSize = BinaryPrimitives.ReadInt16LittleEndian(_buffer.Memory.Slice(bufferPos, 2).Span);
            if (packetSize > _bufferLen)
            {
                break;
            }
            
            var packetData = _buffer.Memory.Slice(bufferPos, packetSize);
            
            packets.Add(new PacketReader(packetData.ToArray()));
            
            bufferPos += packetSize;
        }

        // Shift buffer
        if (bufferPos == _bufferLen)
        {
            _bufferLen = 0;
        }
        else if (bufferPos > 0)
        {
            _buffer.Memory.Slice(bufferPos, _bufferLen - bufferPos).CopyTo(_buffer.Memory);
            _bufferLen -= bufferPos;
        }
        
        return packets;
    }
    
    public void Dispose()
    {
        _buffer.Dispose();
    }
}