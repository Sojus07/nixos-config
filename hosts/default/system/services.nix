{ config, pkgs, ... }:
{
  services = {
    libinput = {
      enable = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    dbus.enable = true;
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    gnome.gnome-keyring.enable = true;
  };
  security.rtkit.enable = true;
}
