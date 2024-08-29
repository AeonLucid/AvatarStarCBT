using System.Net;
using System.Net.Sockets;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace AvatarStar.Server.Game;

public class GameServerService : BackgroundService
{
    private readonly ILogger<GameServerService> _logger;
    private readonly IServiceProvider _serviceProvider;

    public GameServerService(ILogger<GameServerService> logger, IServiceProvider serviceProvider)
    {
        _logger = logger;
        _serviceProvider = serviceProvider;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        _logger.LogInformation("Starting");

        var clientHandler = new ClientHandler();
        var server = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        server.Bind(new IPEndPoint(IPAddress.Any, 9532));
        server.Listen(10);

        _logger.LogInformation("Listening on *:9532");

        while (!stoppingToken.IsCancellationRequested)
        {
            var clientSocket = await server.AcceptAsync(stoppingToken);
            var client = ActivatorUtilities.CreateInstance<GameClient>(_serviceProvider, clientHandler, clientSocket);

            clientHandler.AddClient(client);
    
            _logger.LogInformation("Accepted connection from {Ip}:{Port}", client.RemoteEndPoint.Address, client.RemoteEndPoint.Port);

            client.Start();
        }
    }
}