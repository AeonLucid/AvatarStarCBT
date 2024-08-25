using System.Buffers;
using System.Net;
using System.Net.Sockets;
using Serilog;

namespace AvatarStar.Server;

public abstract class Client
{
    private readonly ClientHandler _clientHandler;
    private readonly Socket _socket;
    private readonly CancellationTokenSource _cancellationToken;
    
    private Task? _loopTask;
    
    public Client(ClientHandler clientHandler, Socket socket)
    {
        _clientHandler = clientHandler;
        _socket = socket;
        _cancellationToken = new CancellationTokenSource();
    }
    
    public IPEndPoint RemoteEndPoint => (IPEndPoint)_socket.RemoteEndPoint!;

    /// <summary>
    ///     Start receiving data from the client.
    /// </summary>
    public void Start()
    {
        if (_loopTask != null)
        {
            return;
        }
        
        _loopTask = LoopAsync();
    }

    /// <summary>
    ///     Stop receiving data from the client.
    /// </summary>
    public Task Stop()
    {
        if (_loopTask == null)
        {
            return Task.CompletedTask;
        }
        
        _cancellationToken.Cancel();
        _clientHandler.RemoveClient(this);
        
        return _loopTask;
    }

    private async Task LoopAsync()
    {
        using var buffer = CreateBuffer();
        using var temp = MemoryPool<byte>.Shared.Rent(4096);
        
        while (!_cancellationToken.IsCancellationRequested)
        {
            try
            {
                var dataLen = await _socket.ReceiveAsync(temp.Memory, _cancellationToken.Token);
                if (dataLen == 0)
                {
                    Log.Information("Client disconnected");
                    _ = Stop();
                    break;
                }

                buffer.Append(temp.Memory.Slice(0, dataLen));

                foreach (var reader in buffer.Process())
                {
                    await HandleAsync(reader);
                }
            }
            catch (SocketException e) when (e.SocketErrorCode == SocketError.ConnectionReset)
            {
                Log.Information("Client disconnected");
                _ = Stop();
                break;
            }
            catch (Exception e)
            {
                Log.Error(e, "Caught exception in client loop");
            }
        }
    }

    protected abstract Task HandleAsync(PacketReader reader);
    
    protected abstract ClientBuffer CreateBuffer();

    protected async Task SendAsync(PacketWriter writer)
    {
        await _socket.SendAsync(writer.GetData(), SocketFlags.None);
    }
}