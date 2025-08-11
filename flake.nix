{
  description = "Sojus07 shitty NixOS Configuration lol";

  inputs = {
    nix-sdr.url = "github:Sojus07/nix-sdr";
    dwm-nix.url = "github:Sojus07/dwm-nix";
    nvf-config.url = "github:Sojus07/nvf-config"; 
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-sdr,
    dwm-nix,
    nvf-config,
  }: {
    nixosConfigurations.iridium = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/iridium/configuration.nix
        home-manager.nixosModules.home-manager
        nix-sdr.nixosModules.default
        dwm-nix.nixosModules.default
        nvf-config.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fabian = import ./modules/home.nix;
          };
        }
      ];
    };
    nixosConfigurations.meteor = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/meteor/configuration.nix
        home-manager.nixosModules.home-manager
        nix-sdr.nixosModules.default
        dwm-nix.nixosModules.default
        nvf-config.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fabian = import ./modules/home.nix;
          };
        }
      ];
    };

    nixosConfigurations.glonass = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/glonass/configuration.nix
        home-manager.nixosModules.home-manager
        #nix-sdr.nixosModules.default
        dwm-nix.nixosModules.default
        nvf-config.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.titus = import ./modules/home.nix;
          };
        }
      ];
    };
  };
}
