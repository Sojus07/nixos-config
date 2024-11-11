{ config, pkgs, inputs, nixvim, ... }:
{
    imports = [
        <nixvim>.homeManagerModules.nixvim
    ];
    programs.nixvim = {
        enable = true;
        colorschemes.oxocarbon.enable = true;
        plugins = {
            lualine = {
                enable = true;
            };
        };
    };
}

