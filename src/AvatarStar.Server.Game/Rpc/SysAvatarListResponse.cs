using AvatarStar.Server.Game.Config;

namespace AvatarStar.Server.Game.Rpc;

public class SysAvatarListResponse
{
    public class SuitList
    {
        public required SuitListAvatar Avatar { get; init; }
        public required SuitListPart[] Part { get; init; }

        public static SuitList FromConfig(int configAvatarId, SysCharacter sysCharacter)
        {
            return new SuitList
            {
                Avatar = new SuitListAvatar
                {
                    AvatarId = configAvatarId,
                    Skin = "{}",
                    Eye = "{}",
                    Mouth = "{}",
                    Nose = "{}",
                    Ear = "{}",
                    Beard = "{}",
                    Hair = "{}",
                    Helmet = "{}",
                    Underwear = "{}",
                    Outerwear = "{}",
                    Trousers = "{}",
                    Glove = "{}",
                    Shoes = "{}",
                    Decal = "{}",
                    Movable = "{}",
                    Immobile = "{}",
                    ImmobileUp = "{}",
                    ImmobileDown = "{}"
                },
                Part = sysCharacter.Options.Head.Select(x => new SuitListPart
                {
                    PartId = 7,
                    Value = LuaMethods.GetSpartInfo(x.Resource, 7, 0, x.Colors)
                }).Concat(sysCharacter.Options.Eye.Select(x => new SuitListPart
                {
                    PartId = 2,
                    Value = LuaMethods.GetEyeInfo(x.Resource,
                        x.LeftTranslateX, x.LeftTranslateY, x.LeftTheta, x.LeftScaleX, x.LeftScaleY,
                        x.RightTranslateX, x.RightTranslateY, x.RightTheta, x.RightScaleX, x.RightScaleY,
                        x.Colors)
                })).Concat(sysCharacter.Options.Mouth.Select(x => new SuitListPart
                {
                    PartId = 3,
                    Value = LuaMethods.GetFaceAnimInfo(x.Resource, 3, x.TranslateX, x.TranslateY, x.Theta, x.ScaleX, x.ScaleY, x.Colors)
                })).Concat(sysCharacter.Options.Trinket.Select(x => new SuitListPart
                {
                    PartId = 18,
                    Value = "{" + string.Join(',', x.Select(y => LuaMethods.GetSpartInfo(y.Resource, 18, 1, y.Colors))) + "}"
                })).ToArray()
            };
        }
    }

    public class SuitListAvatar
    {
        public required int AvatarId { get; set; }
        public required string Skin { get; set; }
        public required string Eye { get; set; }
        public required string Mouth { get; set; }
        public required string Nose { get; set; }
        public required string Ear { get; set; }
        public required string Beard { get; set; }
        public required string Hair { get; set; }
        public required string Helmet { get; set; }
        public required string Underwear { get; set; }
        public required string Outerwear { get; set; }
        public required string Trousers { get; set; }
        public required string Glove { get; set; }
        public required string Shoes { get; set; }
        public required string Decal { get; set; }
        public required string Movable { get; set; }
        public required string Immobile { get; set; }
        public required string ImmobileUp { get; set; }
        public required string ImmobileDown { get; set; }
    }

    public class SuitListPart
    {
        public required int PartId { get; set; }
        public required string Value { get; set; }
    }
}