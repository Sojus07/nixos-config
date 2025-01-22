{
  config,
  pkgs,
  ...
}: {
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
      ".wp/fuji.png".source = ./raw/wp/fuji.png;
      ".wp/orbit.png".source = ./raw/wp/orbit.png;
      ".wp/hollow_knight.png".source = ./raw/wp/hollow_knight.png;
      ".wp/ios.png".source = ./raw/wp/ios.png;
      ".wp/manga.png".source = ./raw/wp/manga.png;
      ".wp/bg.png".source = ./raw/wp/bg.png;
      ".wp/wolf.png".source = ./raw/wp/wolf.png;
      ".wp/nixos_dark.png".source = ./raw/wp/nixos_dark.png;
      ".wp/GABE_Windows.png".source = ./raw/wp/GABE_Windows.png;
    };
  };
}
