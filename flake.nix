{
    description = "My first flake!";

    inputs = {
        nixpkgs-stable.url = "nixpkgs/nixos-24.05";
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = { self, nixpkgs, nixpkgs-stable, nixvim, home-manager, ... }:
    let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in {
        nixosConfigurations = {
            poggers = lib.nixosSystem {
                inherit system;
                modules = [ 
                    ./configuration.nix 
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.users.fabian = import ./modules/home.nix;
                        home-manager.extraSpecialArgs = {
                            inherit nixvim;
                            inherit pkgs-stable;
                        };
                    }
                ];
                specialArgs = {
                    inherit pkgs-stable;
                    inherit nixvim;
                };
            };
        };
    };
}
