using System.Buffers;
using System.Buffers.Binary;
using System.Net.Sockets;
using Serilog;

namespace AvatarStar.Server.Login;

public class LoginClient : Client
{
    public LoginClient(ClientHandler clientHandler, Socket socket) : base(clientHandler, socket)
    {
    }

    protected override async Task HandleAsync(PacketReader reader)
    {
        var packetId = reader.ReadByte();
        
        Log.Debug("Handling packet {PacketId} with payload length {PacketLen}", packetId, reader.Remaining);

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
                await WritePacket3(ServerErrorCode.Success, "AuthToken");
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

    protected override ClientBuffer CreateBuffer()
    {
        return new LoginClientBuffer();
    }

    protected override Task SendAsync(ArraySegment<byte> data)
    {
        var bufferLen = data.Count + sizeof(short);
        var buffer = ArrayPool<byte>.Shared.Rent(bufferLen);
        
        try
        {
            // Write packet length.
            BinaryPrimitives.WriteInt16LittleEndian(buffer, (short)bufferLen);
            
            // Write payload.
            data.CopyTo(new ArraySegment<byte>(buffer, 2, data.Count));
            
            return base.SendAsync(new ArraySegment<byte>(buffer, 0, bufferLen));
        }
        finally
        {
            ArrayPool<byte>.Shared.Return(buffer);
        }
    }

    private async Task WritePacket0(ServerErrorCode errorCode)
    {
        using var writer = new PacketWriter();
        
        writer.WriteByte(0);
        writer.WriteInt((int)errorCode);
        
        await SendAsync(writer);
    }

    /// <summary>
    ///     Handler 0x446500
    ///     Calls SendMessageW(.., 1339, this->field_2C, this->field_3)
    /// </summary>
    private async Task WritePacket1()
    {
        using var writer = new PacketWriter();
        
        writer.WriteByte(1);
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
        using var writer = new PacketWriter();
        
        writer.WriteByte(2);
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
    private async Task WritePacket3(ServerErrorCode errorCode, string? authToken)
    {
        using var writer = new PacketWriter();
        
        writer.WriteByte(3);
        // WPARAM (ErrorCode)
        writer.WriteInt((int)errorCode);
        
        // Data below only when error code is success.
        if (errorCode == ServerErrorCode.Success)
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
        using var writer = new PacketWriter();
        
        writer.WriteByte(4);
        
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
}