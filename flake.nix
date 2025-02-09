{
  description = "fqbn207 shitty NixOS Configuration lol";

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
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/default/configuration.nix
        nvf.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fabian = import ./hosts/computer/modules/home/home.nix;
          };
        }
      ];
    };
    
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/laptop/configuration.nix
        nvf.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.fabian = import ./hosts/laptop/modules/home/home.nix;
          };
        }
      ];
    };
  };
}
