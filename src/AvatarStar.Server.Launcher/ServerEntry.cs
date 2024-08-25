namespace AvatarStar.Server.Launcher;

public record ServerEntry(byte Id, string Name, string Ip, int Port, byte Status);