{
    description = "My NixOS Configuration";

    inputs = {
        nixpkgs-stable.url = "nixpkgs/nixos-24.05";
        nixpkgs.url = "nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, nixpkgs-stable, ... }:
    let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    
    in {
        nixosConfigurations = {
            default = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./configuration.nix ];
                specialArgs = {
                    inherit pkgs-stable;
                };
            };
        };
    };
}
