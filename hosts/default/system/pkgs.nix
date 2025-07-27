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
    flameshot
    feh
    gnumake
    tree
    gdb
    wireshark

    # Command-line utilities
    neofetch
    fastfetch
    onefetch
    cpufetch
    vim
    weechat
    ranger
    fzf
    htop
    btop
    jq
    ffmpeg
    gh-dash

    # Development & compilers
    rustup
    python3
    python312Packages.pip
    nodejs
    gccgo14
    go
    bear

    # Android development
    android-tools
    android-udev-rules
    android-studio-tools

    # Windows compatibility
    wine
    winetricks

    # Embedded & hardware development
    esptool
    espflash
    minicom
    cp210x-program
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

    # Miscellaneous
    cava
    vesktop
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
      nerd-fonts._0xproto
      nerd-fonts.droid-sans-mono
      nerd-fonts.terminess-ttf
    ];
  };

}
