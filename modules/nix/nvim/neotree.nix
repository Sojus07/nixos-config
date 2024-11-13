{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        enableDiagnostics = true;
        enableGitStatus = true;
        closeIfLastWindow = true;
        window = {
          position = "right";
          width = 40;
        };
      };
    };
  };
}
