using AvatarStar.Server.Game;
using AvatarStar.Server.Game.Config;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Debug()
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .CreateLogger();

try
{
    var builder = Host.CreateApplicationBuilder(args);
    
    builder.Environment.ContentRootPath = Directory.GetCurrentDirectory();
    // builder.Configuration.AddJsonFile("settings.json", optional: true);
    builder.Configuration.AddJsonFile("Config/AvatarSelection.json", optional: false, reloadOnChange: true);
    builder.Configuration.AddEnvironmentVariables(prefix: "AS_");
    builder.Configuration.AddCommandLine(args);

    builder.Services.Configure<AvatarSelectionConfig>(builder.Configuration.GetSection(AvatarSelectionConfig.Section));
    builder.Services.AddSerilog();
    builder.Services.AddHostedService<GameServerService>();

    var host = builder.Build();
    await host.RunAsync();
    return 0;
}
catch (Exception ex)
{
    Log.Fatal(ex, "Host terminated unexpectedly");
    return 1;
}
finally
{
    await Log.CloseAndFlushAsync();
}