{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./networking.nix
    ./users.nix
    ./services.nix
    ./firefox.nix
    ./pkgs.nix
    ./radio.nix
    ./chromium.nix
  ];
}
