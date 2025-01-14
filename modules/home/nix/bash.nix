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
        rm = "rm $@ -v -I";
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
        PS1 = "(\u) %"

        eval "$(fzf --bash)"
        complete -cf doas 
      '';
    };
  };
}
