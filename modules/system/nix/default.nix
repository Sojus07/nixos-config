{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./dns.nix
    ./gaming.nix
    ./firefox.nix
    ./x/dwm/default.nix
    ./nvim/default.nix
    #./x/slstatus/default.nix
  ];
}
