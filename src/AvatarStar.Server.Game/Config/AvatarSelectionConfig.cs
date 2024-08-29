using System.Drawing;

namespace AvatarStar.Server.Game.Config;

public class AvatarSelectionConfig
{
    public const string Section = "AvatarSelection";

    public Dictionary<int, SysCharacterSex> SysCharacters { get; set; } = new();
}

public class SysCharacterSex
{
    public required SysCharacter Male { get; init; }
    public required SysCharacter Female { get; init; }
}

public class SysCharacter
{
    public required SysCharacterOptions Options { get; init; }
}

public class SysCharacterOptions
{
    public required CharacterSpartInfo[] Head { get; init; }
    public required CharacterEyeInfo[] Eye { get; init; }
    public required CharacterFaceAnimInfo[] Mouth { get; init; }
    public required CharacterSpartInfo[][] Trinket { get; init; }
}

public class CharacterSpartInfo
{
    public required string Resource { get; init; }
    public required Color[] Colors { get; init; }
}

public class CharacterEyeInfo
{
    public required string Resource { get; init; }
    public required float LeftTranslateX { get; init; }
    public required float LeftTranslateY { get; init; }
    public required float LeftTheta { get; init; }
    public required float LeftScaleX { get; init; }
    public required float LeftScaleY { get; init; }
    public required float RightTranslateX { get; init; }
    public required float RightTranslateY { get; init; }
    public required float RightTheta { get; init; }
    public required float RightScaleX { get; init; }
    public required float RightScaleY { get; init; }
    public required Color[] Colors { get; init; }
}


public class CharacterFaceAnimInfo
{
    public required string Resource { get; init; }
    public required float TranslateX { get; init; }
    public required float TranslateY { get; init; }
    public required float Theta { get; init; }
    public required float ScaleX { get; init; }
    public required float ScaleY { get; init; }
    public required Color[] Colors { get; init; }
}
