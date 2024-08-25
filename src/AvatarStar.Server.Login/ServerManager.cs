namespace AvatarStar.Server.Login;

public class ServerManager
{
    public static readonly ServerCategory[] Servers = [
        new ServerCategory(1, "Category", [
            new ServerEntry(1, "Server 1", "127.0.0.1", 1234, 0),
            new ServerEntry(2, "Server 2", "127.0.0.1", 1234, 51),
            new ServerEntry(3, "Server 3", "127.0.0.1", 1234, 81),
            new ServerEntry(4, "Server 4", "127.0.0.1", 1234, 255),
        ]),
        new ServerCategory(2, "Category 2", [
            new ServerEntry(5, "Server 5", "127.0.0.1", 1234, 0),
            new ServerEntry(6, "Server 6", "127.0.0.1", 1234, 51)
        ])
    ];
}