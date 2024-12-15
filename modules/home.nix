{
  config,
  pkgs,
  stable,
  ...
}:
{
  imports = [
    ./nix/user.nix
    ./nix/nvim/default.nix
    ./nix/hypr/default.nix
    ./nix/bspwm/default.nix
  ];

  home = {
    packages = with stable; [

    ];
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    file = {
      ".wp/temple.png".source = ./raw/wp/temple.png;
      ".wp/skull_purple.png".source = ./raw/wp/skull_purple.png;
      ".wp/gruvbox-dark-blue.png".source = ./raw/wp/gruvbox-dark-blue.png;
      ".wp/anime_blue.png".source = ./raw/wp/anime_blue.png;
    };
  };
}
