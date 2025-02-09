{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./x/dwm/default.nix
    ./nvim/default.nix
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
  ];
}
