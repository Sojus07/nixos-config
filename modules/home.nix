{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./nix
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";
    file = {
      ".wp/temple.png".source = ./raw/wp/temple.png;
      ".wp/skull_purple.png".source = ./raw/wp/skull_purple.png;
      ".wp/gruvbox-dark-blue.png".source = ./raw/wp/gruvbox-dark-blue.png;
      ".wp/anime_blue.png".source = ./raw/wp/anime_blue.png;
    };
  };
}
