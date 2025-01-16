{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/nix/default.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "freeimage-unstable-2021-11-01"
      ];
    };
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  systemd = {
    services = {
      modem-manager.enable = false;
      mpd.environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
      };
    };
  };
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

  networking = {
    hostName = "poggers";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        1337
        8080
        3000
        8000
      ];
    };
  };

  time.timeZone = "Europe/Berlin";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  xdg.portal = {
    enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services = {
    libinput = {
      enable = true;
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
    nix-ld.enable = true;
    fish.enable = true;
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.fish;
    users = {
      fabian = {
        useDefaultShell = true;
        shell = pkgs.fish;
        isNormalUser = true;
        initialPassword = "1601";
        extraGroups = [
          "wheel"
          "docker"
          "audio"
          "video"
          "dialout"
          "plugdev"
          "adbusers"
          "kvm"
          "dialout"
        ];
      };
    };
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
    gnumake
    flameshot
    tree
    gdb
    vscode
    pavucontrol
    usbutils
    alsa-utils
    neovide

    # cli
    neofetch
    fastfetch
    onefetch
    vim
    weechat
    ranger
    eza
    fzf
    htop
    btop
    kew

    # dev
    rustup
    python3
    nodejs
    gccgo14
    go
    dotnet-sdk
    bear
    android-tools
    android-udev-rules
    android-studio-tools

    # embedded
    espup
    esphome
    esptool
    ethtool
    espflash
    minicom
    pulseview
    cp210x-program
    arduino-ide
    arduino-cli
    flashrom
    binwalk
    chirp
    picocom
    pwndbg
    gdb
    minipro

    # LSPs
    nixd
    arduino-language-server

    # libs
    python312Packages.pyserial
    python312Packages.meshtastic

    # virt
    qemu

    # SDR
    noaa-apt
    wsjtx
    qsstv
    gpredict
    sdrangel
    sdrpp
    gnuradio
    cubicsdr
    gqrx
    multimon-ng

    # misc
    cava
    vesktop
    pacman
    wf-recorder

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
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      fantasque-sans-mono
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      pkgs.nerd-fonts._0xproto
      pkgs.nerd-fonts.droid-sans-mono
    ];
  };

  environment.etc = {
    "makepkg.conf".source = "${pkgs.pacman}/etc/makepkg.conf";
    "pacman.conf".source = ./modules/system/raw/pacman.conf;
  };

  system.stateVersion = "unstable";

}
