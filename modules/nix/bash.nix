{ config, pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      sessionVariables = {
        DEVKITPRO = "/opt/devkitpro";
        DEVKITPPC = "/opt/devkitpro/devkitPPC";
        DEVKITA64 = "/opt/devkitpro/devkitA64";
        DEVKITARM = "/opt/devkitpro/devkitARM";
        PATH = "/opt/devkitpro/tools/bin:$PATH";
      };
      shellAliases = {
        http = "python3 -m http.server";
        rm = "rm -rfv";
        ls = "${pkgs.eza}/bin/eza -l --icons";
        cp = "cp -rv";
        mv = "mv -v";
        mkdir = "mkdir -pv";
        update = "doas nixos-rebuild switch";
      };
      shellOptions = [
        "histappend"
        "checkwinsize"
        "extglob"
        "globstar"
        "checkjobs"
      ];
      initExtra = ''
        eval "$(fzf --bash)"
        PS1="\w % "

      '';
    };
  };
}
