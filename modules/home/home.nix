{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./tmux.nix
    ./alacritty.nix
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";
    file = {
      ".wp/galaxy.png".source = ./raw/wp/galaxy.png;
      ".wp/eye.png".source = ./raw/wp/eye.png;
    };
  };
}
