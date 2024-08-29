using System.Drawing;
using System.Text;

namespace AvatarStar.Server.Game;

public class LuaMethods
{
    public static string GetChannelInfo(Color[] colors)
    {
        var builder = new StringBuilder();

        builder.Append(colors.Length);

        foreach (var color in colors)
        {
            builder.Append(',');
            builder.Append(color.R);
            builder.Append(',');
            builder.Append(color.G);
            builder.Append(',');
            builder.Append(color.B);
        }
        
        for (var i = colors.Length; i < 3; i++)
        {
            builder.Append(",0,0,0");
        }

        return builder.ToString();
    }

    // 1.0f default scale
    // 10.0f is smaller
    // 0.1   is bigger
    public static string GetFaceAnimInfo(
        string texResName, int partId, 
        float translateX, float translateY, float theta, float scaleX, float scaleY, 
        Color[] colors)
    {
        var builder = new StringBuilder();

        builder.Append('{');
        builder.Append($"'{texResName}',");
        builder.Append($"{partId},");
        builder.Append($"{translateX:G},");
        builder.Append($"{translateY:G},");
        builder.Append($"{theta:G},");
        builder.Append($"{scaleX:G},");
        builder.Append($"{scaleY:G},");
        builder.Append(GetChannelInfo(colors));
        builder.Append('}');
        
        return builder.ToString();
    }
    
    /// <summary>
    /// 
    /// </summary>
    /// <param name="texResName"></param>
    /// <param name="leftTranslateX">Positive: Move closer to middle of the face. Negative: Move away.</param>
    /// <param name="leftTranslateY">Positive to move up on the face, negative to move down.</param>
    /// <param name="leftTheta"></param>
    /// <param name="leftScaleX"></param>
    /// <param name="leftScaleY"></param>
    /// <param name="rightTranslateX">Negative: Move closer to middle of the face. Positive: Move away.</param>
    /// <param name="rightTranslateY">Positive to move up on the face, negative to move down.</param>
    /// <param name="rightTheta"></param>
    /// <param name="rightScaleX"></param>
    /// <param name="rightScaleY"></param>
    /// <param name="colors"></param>
    /// <returns></returns>
    public static string GetEyeInfo(
        string texResName, 
        float leftTranslateX, float leftTranslateY, float leftTheta, float leftScaleX, float leftScaleY, 
        float rightTranslateX, float rightTranslateY, float rightTheta, float rightScaleX, float rightScaleY,
        Color[] colors)
    {
        var builder = new StringBuilder();

        builder.Append('{');
        builder.Append($"'{texResName}',");
        builder.Append("2,");
        builder.Append($"{leftTranslateX:G},");
        builder.Append($"{leftTranslateY:G},");
        builder.Append($"{leftTheta:G},");
        builder.Append($"{leftScaleX:G},");
        builder.Append($"{leftScaleY:G},");
        builder.Append($"{rightTranslateX:G},");
        builder.Append($"{rightTranslateY:G},");
        builder.Append($"{rightTheta:G},");
        builder.Append($"{rightScaleX:G},");
        builder.Append($"{rightScaleY:G},");
        builder.Append(GetChannelInfo(colors));
        builder.Append('}');
        
        return builder.ToString();
    }
    
    public static string GetSpartInfo(string resName, int partId, int indexInLayer, Color[] colors)
    {
        var builder = new StringBuilder();

        builder.Append('{');
        builder.Append($"'{resName}',");
        builder.Append($"{partId},");
        builder.Append($"{indexInLayer},");
        builder.Append(GetChannelInfo(colors));
        builder.Append('}');
        
        return builder.ToString();
    }
}