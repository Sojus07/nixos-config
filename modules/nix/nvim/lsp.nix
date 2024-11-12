{ config, pkgs, nixvim, ... }:
{
	programs.nixvim.plugins = {
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
        lsp = {
			enable = true;
            servers = {
                asm_lsp = {
                    enable = true;
                    autostart = true;
                };
                clangd = {
                    enable = true;
                    autostart = true;
                };
                gopls = {
                    enable = true;
                    autostart = true;
                };
                lua_ls = {
                    enable = true;
                    autostart = true;
                };
                nixd = {
                    enable = true;
                    autostart = true;
                };
                pyright = {
                    enable = true;
                    autostart = true;
                };
                #rust_analyzer = {
                #    enable = true;
                #    autostart = true;
                #    installCargo = true;
                #    installRustc = true;
                #};
            }; 
        };
	};
}
