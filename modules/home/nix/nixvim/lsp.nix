{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim.plugins = {
    clangd-extensions.enable = true;
    crates.enable = true;
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        csharp_ls = {
          enable = true;
          autostart = true;
        };
        bashls = {
          enable = true;
          autostart = true;
        };
        html = {
          enable = true;
          autostart = true;
        };
        lua_ls = {
          enable = true;
          autostart = true;
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
          autostart = true;
        };
        pyright = {
          enable = true;
          autostart = true;
        };
        gopls = {
          enable = true;
          autostart = true;
        };
        clangd = {
          enable = true;
          autostart = true;
        };
        omnisharp = {
          enable = true;
          autostart = true;
        };
        arduino_language_server = {
          enable = true;
          autostart = true;
        };
      };
    };
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          cmd = [
            "rustup"
            "run"
            "nightly"
            "rust-analyzer"
          ];
          default_settings = {
            rust-analyzer = {
              check = {
                command = "clippy";
              };
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "always";
                };
              };
            };
          };
          standalone = false;
        };
      };
    };
  };
}
