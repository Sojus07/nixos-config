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
    ./sec.nix
    ./virt.nix
    ./boot.nix
    ./hw.nix  
    ./fingerprint.nix
  ];
}
