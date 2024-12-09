{
  description = "My first flake!";

  inputs = {
    pkgs-stable.url = "nixpkgs/nixos-24.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      pkgs-stable,
      home-manager,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      stable = pkgs-stable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        poggers = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.fabian = import ./modules/home.nix;
              };
              home-manager.extraSpecialArgs = {
                inherit nixvim;
                inherit stable;
              };
            }
          ];
        };
        specialArgs = {
          inherit stable;
        };
      };
    };
}
