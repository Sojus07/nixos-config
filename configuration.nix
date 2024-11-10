{ config, lib, pkgs, pkgs-stable,... }:
let
    home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
	imports =
	[
		(import "${home-manager}/nixos")
		./hardware-configuration.nix
        ./modules/nix/firefox.nix	
    ];
	
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    boot.loader.systemd-boot.enable = true;	

	networking.hostName = "poggers"; 
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Berlin";
	console = {
		font = "Lat2-Terminus16";
		useXkbConfig = true;
	};

  	services = {
		xserver = {
			enable = true;
			displayManager.startx.enable = true;
			windowManager.i3.enable = true;
		};
		pipewire = {
			enable = true;
			pulse.enable = true;
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
		opengl = {
            enable = true;
		};
	    rtl-sdr = {
            enable = true;
        };
    };

	programs = {
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
		extraGroups = [ "wheel" "docker" "audio" "video" "dialout" "plugdev" ];
  	};

 	environment.systemPackages = 
    (with pkgs; [
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
        
        # radio
        sdrplay
        sdrpp
        hackrf
        rtl-sdr
        gqrx
        noaa-apt
        rtl_433
        rtl-ais

		# misc		
		cava
		mumble
        discord        
        
        # hardware & shit
  	    libplist
        libimobiledevice
        usbmuxd
        pulseaudio
      	
    ])
	++
	(with pkgs-stable; [
		wezterm
	]);
   
    

  	networking = {
        firewall = { 
            enable = true; 
            allowedTCPPorts = [ 80 1337 8080 ]; 
        };
    };

	security = {
        doas = {
            enable = true;
            extraRules = [{
                users = [ "fabian" ];
            	noPass = true;
                keepEnv = true;
			}];
        }; 
    };
	
	fonts.fontconfig.enable = true;
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        fantasque-sans-mono
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
    	nerdfonts
	]; 	

  	system.stateVersion = "unstable"; 
	
	home-manager.users.fabian = import ./modules/home.nix;
}

