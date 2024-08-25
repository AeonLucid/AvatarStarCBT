namespace AvatarStar.Server.Login;

public record ServerEntry(byte Id, string Name, string Ip, int Port, byte Status);