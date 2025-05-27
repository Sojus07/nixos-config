{
  description = "Sojus07 shitty NixOS Configuration lol";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
  }: {
    nixosConfigurations.iridium = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/iridium/configuration.nix
        nvf.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fabian = import ./hosts/default/home/home.nix;
          };
        }
      ];
    };
    
    nixosConfigurations.meteor = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/meteor/configuration.nix
        nvf.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fabian = import ./hosts/default/home/home.nix;
          };
        }
      ];
    };
  };
}
