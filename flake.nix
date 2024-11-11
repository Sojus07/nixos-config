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
    outputs = inputs@{ nixpkgs, nixpkgs-stable, home-manager, nixvim, ... }: {
        nixosConfigurations = {
            poggers = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.fabian = import ./modules/home.nix;
                        home-manager.extraSpecialArgs = {
                            inherit nixvim;
                            inherit inputs;
                        };
                    }
                ];
            };
        };
    }; 
}
