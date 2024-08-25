using System.Net.Sockets;

namespace AvatarStar.Server.Login;

public class ClientHandler
{
    private readonly HashSet<Client> _clients;

    public ClientHandler()
    {
        _clients = new HashSet<Client>();
    }

    public Client AddClient(Socket socket)
    {
        var client = new Client(this, socket);

        _clients.Add(client);

        return client;
    }
    
    public void RemoveClient(Client client)
    {
        _clients.Remove(client);
    }
}