{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System utilities
    unzip
    yt-dlp
    inetutils
    git
    wget
    curl
    dosfstools
    ntfs3g
    usbutils
    alsa-utils
    pavucontrol
    flameshot
    feh
    gnumake
    tree
    gdb
    vscode
    neovide

    # Command-line utilities
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
    jq

    # Development & compilers
    rustup
    python3
    python312Packages.pip
    nodejs
    gccgo14
    go
    dotnet-sdk
    bear

    # Android development
    android-tools
    android-udev-rules
    android-studio-tools

    # Windows compatibility
    wine
    winetricks

    # Embedded & hardware development
    espup
    esphome
    esptool
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
    minipro
    ethtool

    # Language servers (LSPs)
    nixd
    arduino-language-server

    # Libraries
    python312Packages.pyserial
    python312Packages.meshtastic

    # Virtualization
    qemu

    # Software Defined Radio (SDR)
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

    # Miscellaneous
    cava
    vesktop
    pacman
    wf-recorder
    qbittorrent
  ];
  
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      terminus-nerdfont
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
