{ config, pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      grub = {
        enable = false;
        device = "/dev/sda";
        useOSProber = true;
      };
    };
    supportedFilesystems = [ "ntfs" ];
  };
}
