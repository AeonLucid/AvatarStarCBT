using System.Buffers;
using AvatarStar.Server.Utilities;
using Serilog;
using Serilog.Events;

namespace AvatarStar.Server;

public abstract class ClientBuffer : IDisposable
{
    private const int BufferSize = 4096;
    
    private readonly int _minBufferSize;
    private readonly bool _packetSizeInclusive;

    private IMemoryOwner<byte> _buffer;
    private int _bufferLen;
    
    public ClientBuffer(int minBufferSize, bool packetSizeInclusive)
    {
        _minBufferSize = minBufferSize;
        _packetSizeInclusive = packetSizeInclusive;
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
        while (_bufferLen - bufferPos >= _minBufferSize)
        {
            var packetSize = ReadPacketSize(_buffer.Memory.Slice(bufferPos).Span, out var packetSizeLen);
            if (packetSize == -1)
            {
                throw new ClientBufferException("Invalid packet size");
            }
            
            if (packetSize > _bufferLen)
            {
                break;
            }

            var payloadLen = _packetSizeInclusive ? packetSize - packetSizeLen : packetSize;
            var payloadSpan = _buffer.Memory.Slice(bufferPos + packetSizeLen, payloadLen);
            var payloadData = payloadSpan.ToArray();
            
            packets.Add(new PacketReader(payloadData));

            if (_packetSizeInclusive)
            {
                bufferPos += packetSize;
            }
            else
            {
                bufferPos += packetSize + packetSizeLen;
            }
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

    protected abstract int ReadPacketSize(Span<byte> buffer, out int packetSizeLen);

    public void Dispose()
    {
        _buffer.Dispose();
    }
}