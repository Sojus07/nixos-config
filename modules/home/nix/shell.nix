{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    grc
  ];
  programs = {
    fish = {
      enable = true;
      generateCompletions = true;
      interactiveShellInit = ''
        set -gx DEVKITPRO "/opt/devkitpro";
        set -gx DEVKITPPC "/opt/devkitpro/devkitPPC";
        set -gx DEVKITA64 "/opt/devkitpro/devkitA64";
        set -gx DEVKITARM "/opt/devkitpro/devkitARM";
        set -gx PATH "/opt/devkitpro/tools/bin:$PATH";
      '';
      shellAliases = {
        g = "git";
        gc = "git commit";
        ga = "git add -A";
        http = "python3 -m http.server";
        ls = "${pkgs.eza}/bin/eza -la --icons";
        cp = "cp -rv";
        mv = "mv -v";
        mkdir = "mkdir -pv";
        update = "doas nixos-rebuild switch";
      };
      plugins = [
        {
          name = "z";
          src = pkgs.fishPlugins.z.src;
        }
        {
          name = "sponge";
          src = pkgs.fishPlugins.sponge.src;
        }
        {
          name = "pisces";
          src = pkgs.fishPlugins.pisces.src;
        }
        {
          name = "fzf-fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "hydro";
          src = pkgs.fishPlugins.hydro.src;
        }
        {
          name = "grc";
          src = pkgs.fishPlugins.grc.src;
        }
        {
          name = "git-abbr";
          src = pkgs.fishPlugins.git-abbr.src;
        }
        {
          name = "forgit";
          src = pkgs.fishPlugins.forgit.src;
        }
        {
          name = "colored-man-pages";
          src = pkgs.fishPlugins.colored-man-pages.src;
        }
        {
          name = "bobthefisher";
          src = pkgs.fishPlugins.bobthefisher.src;
        }
      ];
    };

    bash = {
      enable = false;
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
        PS1="(\u) % "

        eval "$(fzf --bash)"
        complete -cf doas 
      '';
    };
  };
}
