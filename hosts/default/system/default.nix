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

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };
  

}
