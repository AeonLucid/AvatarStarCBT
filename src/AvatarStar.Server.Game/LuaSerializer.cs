using Luaon.Json;
using Newtonsoft.Json;

namespace AvatarStar.Server.Game;

public static class LuaSerializer
{
    private static readonly JsonSerializer serializer = JsonSerializer.CreateDefault();
    
    public static string Serialize(object obj)
    {
        using var sw = new StringWriter();
        using (var jlw = new JsonLuaWriter(sw))
        {
            jlw.CloseOutput = false;
            jlw.Formatting = Formatting.Indented;
            
            serializer.Serialize(jlw, obj);
        }
        
        return sw.ToString();
    }
}