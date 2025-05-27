{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./editors/nvim/default.nix
    ./networking.nix
    ./users.nix
    ./services.nix
    ./firefox.nix
    ./pkgs.nix
  ];
}
