namespace AvatarStar.Server;

public class ClientHandler
{
    private readonly HashSet<Client> _clients;

    public ClientHandler()
    {
        _clients = new HashSet<Client>();
    }

    public Client AddClient(Client client)
    {
        _clients.Add(client);

        return client;
    }
    
    public void RemoveClient(Client client)
    {
        _clients.Remove(client);
    }
}