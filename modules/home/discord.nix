{ config, pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "canary";
      enableMenu = true;
      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;
      arRPC = true;
      disableMinSize = true;
      enableSplashScreen = false;
    };
    vencord = {
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        plugins = {
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };
          CallTimer.enabled = true;
          fakeNitro.enabled = true;
        };
        enabledThemes = [ ../raw/themes/system24.css ]; 
      };
    };
  };
}
