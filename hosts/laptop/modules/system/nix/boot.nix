{ config, pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        extraEntries = {
          "mint.conf" = ''
            title Linux Mint
            efi /EFI/ubuntu/shimx64.efi
          '';
        };
      };
    };
    supportedFilesystems = [ "ntfs" ];
  };
}
