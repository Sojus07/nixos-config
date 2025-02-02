{ config, pkgs, ... }:
{
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
    jq

    # dev
    rustup
    python3
    python312Packages.pip
    nodejs
    gccgo14
    go
    dotnet-sdk
    bear
    android-tools
    android-udev-rules
    android-studio-tools
    
    wine
    winetricks

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
    qbittorrent
  ];
  
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

}
