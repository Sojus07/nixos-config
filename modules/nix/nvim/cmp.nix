{ config, pkgs, nixvim, ...}:
{
	programs.nixvim.plugins = {
		cmp-nvim-lsp.enable = true;
	  	cmp-path.enable = true;
	  	cmp-buffer.enable = true;
		cmp = {
			enable = true;
      		autoEnableSources = true;
            settings = {
				mapping = {
                    "<C-Space>" = "cmp.mapping.complete()";
                    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                    "<C-e>" = "cmp.mapping.close()";
                    "<C-f>" = "cmp.mapping.scroll_docs(4)";
                    "<CR>" = "cmp.mapping.confirm({ select = true })";
                    "<S-Tab>" = {
                        action = "cmp.mapping.select_prev_item()";
                        modes = [
                            "i"
                            "s"
                        ];
                    };
                    "<Tab>" = {
                        action = "cmp.mapping.select_next_item()";
                        modes = [
                            "i"
                            "s"
                        ];
                    };
                };
			};
		};
	};
}
