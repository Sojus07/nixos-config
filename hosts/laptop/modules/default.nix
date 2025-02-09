{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../../../default/windowManager/dwm/default.nix
    ../../../../default/editors/nvim/default.nix
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
