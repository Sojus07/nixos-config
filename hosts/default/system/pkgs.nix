{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System utilities
    unzip
    inetutils
    git
    wget
    curl
    dosfstools
    ntfs3g
    usbutils
    alsa-utils
    pavucontrol
    (flameshot.override { enableWlrSupport = true; })
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
    ffmpeg

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
    stellarium

    # Miscellaneous
    cava
    vesktop
    pacman
    wf-recorder
    qbittorrent
    superTuxKart    
    adwaita-icon-theme
    viewnior
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
      nerd-fonts._0xproto
      nerd-fonts.droid-sans-mono
      nerd-fonts.terminess-ttf
    ];
  };

}
