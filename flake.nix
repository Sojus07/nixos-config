{
    description = "My first flake!";

    inputs = {
        nixpkgs-stable.url = "nixpkgs/nixos-24.05";
        nixpkgs.url = "nixpkgs/nixos-unstable";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-stable, ... }:
    let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in {
    nixosConfigurations = {
        poggers = lib.nixosSystem {
            inherit system;
            modules = [ ./configuration.nix ];
            specialArgs = {
                inherit pkgs-stable;
            };
        };
    };
}
