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
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    sdrplayApi = {
      enable = true;
    };
  };
}
