using System.Buffers;
using System.Net;
using System.Net.Sockets;
using Serilog;

namespace AvatarStar.Server.Login;

public class Client
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
        using var buffer = new ClientBuffer();
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

    private async Task HandleAsync(PacketReader reader)
    {
        var packetLen = reader.ReadShort();
        var packetId = reader.ReadByte();
        
        Log.Debug("Handling packet {PacketId} with payload length {PacketLen}", packetId, packetLen - 3);

        switch (packetId)
        {
            case 0:
            {
                var pUnknown = reader.ReadShort();
                
                Log.Debug("- Unknown {Unknown}", pUnknown);
                break;
            }

            // Authentication
            case 3:
            {
                var pUsername = reader.ReadString();
                var pPassword = reader.ReadString();
                
                Log.Debug("- Username {Username}", pUsername);
                Log.Debug("- Password {Password}", pPassword);

                if (reader.ReadBool())
                {
                    Log.Debug("- Verification1 0x{Verify1}", reader.ReadBytes());
                    Log.Debug("- Verification2 {Verify2}", reader.ReadString());
                }

                if (reader.ReadBool())
                {
                    Log.Debug("- Unknown {UkInt}", reader.ReadInt());
                    Log.Debug("- Unknown {UkShort}", reader.ReadShort());
                }

                // await WritePacket0(ErrorCodes.InvalidCommand);
                await WritePacket3(ErrorCodes.Success, "AuthToken");
                break;
            }

            // Load server list ?
            case 4:
            {
                var pUnknown = reader.ReadByte();
                
                Log.Debug("- Unknown {Unknown}", pUnknown);

                await WritePacket4();
                break;
            }
        }
        
        // Check for remaining data
        if (reader.Remaining > 0)
        {
            Log.Warning("Packet {PacketId} has {Remaining} bytes remaining", packetId, reader.Remaining);
        }
    }

    private async Task WritePacket0(ErrorCodes errorCode)
    {
        using var writer = new PacketWriter(0);
        
        writer.WriteInt((int)errorCode);
        
        await SendAsync(writer);
    }

    /// <summary>
    ///     Handler 0x446500
    ///     Calls SendMessageW(.., 1339, this->field_2C, this->field_3)
    /// </summary>
    private async Task WritePacket1()
    {
        using var writer = new PacketWriter(1);
        
        writer.WriteByte(1);
        writer.WriteString("Test"); // Size >= 0 and < 260
        writer.WriteBool(false);
        writer.WriteBool(false);
        
        await SendAsync(writer);
    }

    /// <summary>
    ///     Handler 0x4466B0
    ///     Calls SendMessageW(.., 1340, 0, LPARAM)
    ///     Sets
    ///     - serverStringOne
    ///     - serverDataOne
    /// </summary>
    private async Task WritePacket2()
    {
        using var writer = new PacketWriter(2);
        
        // SendMessageW LPARAM
        writer.WriteByte(1);
        // serverStringOne
        writer.WriteString("Test"); 
        // serverDataOne
        writer.WriteBytes([0x01, 0x01, 0x01, 0x01]);
        
        await SendAsync(writer);
    }

    /// <summary>
    ///     Handler 0x446790
    ///     Calls SendMessageW(.., 1341, wParam, lParam)
    ///     - serverStringOne
    ///     - serverStringTwo
    ///     - serverDataOne (optional)
    /// </summary>
    private async Task WritePacket3(ErrorCodes errorCode, string? authToken)
    {
        using var writer = new PacketWriter(3);
        
        // WPARAM (ErrorCode)
        writer.WriteInt((int)errorCode);
        
        // Data below only when error code is success.
        if (errorCode == ErrorCodes.Success)
        {
            // 1 = Verification ?
            // 4 = ?
            // 5 = ?
            // writer.WriteByte(5); // 1, 4 or 5
            // writer.WriteString("Test");
            // writer.WriteBytes([0x01, 0x01, 0x01, 0x01]);
            
            // 0 = Success
            writer.WriteByte(0);
            writer.WriteString(authToken ?? "Default");
        }
        
        await SendAsync(writer);
    }

    /// <summary>
    ///     Handler 0x446900
    /// </summary>
    private async Task WritePacket4()
    {
        using var writer = new PacketWriter(4);
        
        for (var i = 0; i < ServerManager.Servers.Length; i++)
        {
            var category = ServerManager.Servers[i];
            
            writer.WriteByte(category.Id);
            writer.WriteString(category.Name); // Max 64

            for (var j = 0; j < category.Servers.Length; j++)
            {
                var server = category.Servers[j];
                
                writer.WriteByte(server.Id);
                writer.WriteString(server.Name); // Max 100
                writer.WriteString(server.Ip); // ServerIp
                writer.WriteInt(server.Port); // ServerPort
                writer.WriteByte(server.Status); // >0 = Idle, >50 = Heavy, >80 = Full, 255 Maintain
                
                // True if there are more servers in the category
                writer.WriteBool(j + 1 < category.Servers.Length);
            }
            
            // True if there are more categories
            writer.WriteBool(i + 1 < ServerManager.Servers.Length);
        }
        
        writer.WriteBool(false);
        
        await SendAsync(writer);
    }
    
    // Packet 255: Empty packet

    private async Task SendAsync(PacketWriter writer)
    {
        await _socket.SendAsync(writer.GetData(), SocketFlags.None);
    }
}