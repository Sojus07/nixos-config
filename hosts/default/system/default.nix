{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./networking.nix
    ./users.nix
    ./services.nix
    ./gaming.nix
    ./firefox.nix
    ./pkgs.nix
    ./sec.nix
    ./virt.nix
    ./boot.nix
    ./hw.nix  
    ./radio.nix
    ./chromium.nix
  ];
}
