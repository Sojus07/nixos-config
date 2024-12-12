{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/nix/firefox.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  boot.loader.systemd-boot.enable = true;

  networking = {
    hostName = "poggers";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        1337
        8080
      ];
    };
  };

  time.timeZone = "Europe/Berlin";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  services = {
    libinput = {
      enable = true;
    };
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      windowManager.bspwm.enable = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    mullvad-vpn = {
      enable = true;
    };
    sdrplayApi = {
      enable = true;
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
    };
    graphics = {
      enable = true;
    };
    rtl-sdr = {
      enable = true;
    };
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    nix-ld.enable = true;
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  users.users.fabian = {
    isNormalUser = true;
    initialPassword = "1601";
    extraGroups = [
      "wheel"
      "docker"
      "audio"
      "video"
      "dialout"
      "plugdev"
    ];
  };

  environment.systemPackages = with pkgs; [
    # sys
    unzip
    yt-dlp
    inetutils
    git
    wget
    curl
    dosfstools
    ntfs3g
    waybar
    xdg-desktop-portal-hyprland
    grim
    slurp
    feh
    chromium

    # cli
    neofetch
    fastfetch
    onefetch
    vim
    weechat
    ranger
    eza
    fzf

    # dev
    rustup
    python3
    nodejs
    gccgo14
    go
    nixd

    # misc
    cava
    discord
  ];
  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "fabian" ];
          noPass = true;
          keepEnv = true;
        }
      ];
    };
  };

  fonts = {
    fontconfig.enable = true;
		packages =
			with pkgs;
			[
				noto-fonts
				noto-fonts-emoji
				liberation_ttf
				fira-code
				fira-code-symbols
				fantasque-sans-mono
				mplus-outline-fonts.githubRelease
				dina-font
				proggyfonts
			]
			++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
  system.stateVersion = "unstable";

}
