{ config, pkgs, nixvim, ... }:
{
    programs.nixvim = {
        plugins = {
            toggleterm.enable = true;
            autoclose.enable = true;
            web-devicons.enable = true;
        };
    };
}
