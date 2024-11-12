{ config, pkgs, nixvim, ...}:
{
	programs.nixvim.plugins = {
		cmp-nvim-lsp.enable = true;
	  	cmp-path.enable = true;
	  	cmp-buffer.enable = true;
		cmp = {
			enable = true;
      		autoEnableSources = false;
            cmdline = {
                completion = {
                    completeopt = [ "menu" "menuone" "noinsert" "noselect" ];
                };
            };
            settings = {
				mapping = {
                    "<C-Space>" = "cmp.mapping.complete()";
                    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                    "<C-e>" = "cmp.mapping.close()";
                    "<C-f>" = "cmp.mapping.scroll_docs(4)";
                    "<CR>" = "cmp.mapping.confirm({ select = false })";
                    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})"; 
                };
                sources = [
                    { name = "nvim_lsp"; keyword_length = 1; max_item_count = 5; }
                    { name = "path"; }
                    { name = "buffer"; }
                ]; 
			};
		};
	};
}
