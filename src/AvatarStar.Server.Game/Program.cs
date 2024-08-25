using System.Net;
using System.Net.Sockets;
using AvatarStar.Server;
using AvatarStar.Server.Game;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Verbose()
    .WriteTo.Console()
    .CreateLogger();

Log.Information("Starting");

var clientHandler = new ClientHandler();
var server = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

server.Bind(new IPEndPoint(IPAddress.Any, 9532));
server.Listen(10);

Log.Information("Listening on *:9532");

while (true)
{
    var clientSocket = await server.AcceptAsync();
    var client = new GameClient(clientHandler, clientSocket);

    clientHandler.AddClient(client);
    
    Log.Information("Accepted connection from {Ip}:{Port}", client.RemoteEndPoint.Address, client.RemoteEndPoint.Port);

    client.Start();
}