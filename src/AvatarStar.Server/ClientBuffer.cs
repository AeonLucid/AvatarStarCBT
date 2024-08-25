using System.Buffers;
using System.Buffers.Binary;
using AvatarStar.Server.Utilities;
using Serilog;
using Serilog.Events;

namespace AvatarStar.Server;

public class ClientBuffer : IDisposable
{
    private const int BufferSize = 4096;
    private const int MinimalPacketSize = 3;
    
    private readonly int _minPacketLength;
    private readonly int _packetLengthSize;
    
    private IMemoryOwner<byte> _buffer;
    private int _bufferLen;
    
    public ClientBuffer(int minPacketLength, int packetLengthSize)
    {
        _minPacketLength = minPacketLength;
        _packetLengthSize = packetLengthSize;
        _buffer = MemoryPool<byte>.Shared.Rent(BufferSize);
        _bufferLen = 0;
    }
    
    public void Append(Memory<byte> data)
    {
        if (Log.IsEnabled(LogEventLevel.Debug))
        {
            Console.WriteLine("Received {0} bytes", data.Length);
            Console.WriteLine(HexDump.Dump(data.ToArray()));
        }
        
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
            var packetSize = _packetLengthSize switch
            {
                1 => _buffer.Memory.Span[bufferPos],
                2 => BinaryPrimitives.ReadInt16LittleEndian(_buffer.Memory.Span.Slice(bufferPos)),
                4 => BinaryPrimitives.ReadInt32LittleEndian(_buffer.Memory.Span.Slice(bufferPos)),
                _ => throw new InvalidOperationException("Invalid packet length size")
            };
            
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