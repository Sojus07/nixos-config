{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim.plugins = {
    clangd-extensions.enable = true;
    crates-nvim.enable = true;
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nixd = {
          enable = true;
          extraOptions = {
            nixos = {
              expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.aurelionite.options";
            };
            home_manager = {
              expr = "(builtins.getFlake \"/etc/nixos\").homeConfigurations.aurelionite.options";
            };
          };
        };
        asm_lsp = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        gopls = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
          autostart = true;
          installRustc = true;
          installCargo = true;
        };
        clangd = {
          enable = true;
          autostart = true;
        };
      };
    };
  };
}
