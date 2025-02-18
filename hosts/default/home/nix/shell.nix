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
        ls = "${pkgs.eza}/bin/eza -l --icons";
        tree = "${pkgs.eza}/bin/eza --tree --icons";
        cp = "cp -rv";
        mv = "mv -v";
        mkdir = "mkdir -pv";
        update = "sudo nixos-rebuild switch --flake /etc/nixos --impure";
      };
      plugins = [
        {
          name = "fzf-fish";
          src = pkgs.fishPlugins.fzf-fish.src;
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
      ];
    };
  };
}
