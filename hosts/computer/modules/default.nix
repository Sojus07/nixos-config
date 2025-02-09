{
  config,
  pkgs,
  ...
}: {
  imports = [
    
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
