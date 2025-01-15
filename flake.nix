{
  description = "fqbn207 shitty NixOS Configuration lol";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
  }: {
    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPakcages."x86_64-linux";
        modules = [./modules/system/nix/nvim/default.nix];
      })
      .neovim;
    nixosConfigurations.poggers = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        nvf.homeManagerModules.default
      ];
    };
  };
}
