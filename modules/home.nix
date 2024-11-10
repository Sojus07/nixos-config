{ config, pkgs, ... }:
{
	imports = 
	[
		./nix/sway.nix
	    ./nix/user.nix
    	./nix/nvim.nix
	];
	
	home.enableNixpkgsReleaseCheck = false;
	home.stateVersion = "24.05";

	home.file = {
		# WEZTERM
		".config/wezterm/wezterm.lua".source = ./raw/wezterm/wezterm.lua;
		# WAYBAR
		".config/waybar/style.css".source = ./raw/waybar/style.css;
		".config/waybar/config".source = ./raw/waybar/config;
		# ROFI
		".config/rofi/config.rasi".source = ./raw/rofi/config.rasi;
	    # WP
        ".wp/temple.png".source = ./raw/wp/temple.png;
        ".wp/skull_purple.png".source = ./raw/wp/skull_purple.png;
    };
}
