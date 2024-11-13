_:
let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
            table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in
{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        window = {
          completion = {
            autocomplete = true;
            col_offset = -3;
            side_padding = 0;
          };
        };
        completion = {
          completeopt = "menu,menuone,noinsert,noselect";
          keyword_length = 1;
        };
        sorting = {
          comparators = [
            "require('cmp.config.compare').offset"
            "require('cmp.config.compare').exact"
            "require('cmp.config.compare').score"
            "require('clangd_extensions.cmp_scores')"
            "require('cmp.config.compare').recently_used"
            "require('cmp.config.compare').locality"
            "require('cmp.config.compare').kind"
            "require('cmp.config.compare').length"
            "require('cmp.config.compare').order"
          ];
        };
        mapping = {
          "<Down>".__raw = ''
            cmp.mapping(function(fallback)
            	if cmp.visible() then
            		cmp.select_next_item()
            	else
            	  fallback()
            	end
            end, { "i", "s" })
          '';

          "<Up>".__raw = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<C-n>" = "cmp.mapping.scroll_docs(-4)";
          "<c-Up>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-Left>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };

        preselect = "cmp.PreselectMode.None";
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_document_symbol";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "path";
            priority = 300;
          }
          {
            name = "cmdline";
            priority = 300;
          }
        ];
      };
    };

    friendly-snippets.enable = true;
    luasnip.enable = true;

    lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          buffer = "";
          calc = "";
          cmdline = "";
          codeium = "󱜙";
          emoji = "󰞅";
          git = "";
          luasnip = "󰩫";
          neorg = "";
          nvim_lsp = "";
          nvim_lua = "";
          path = "";
          spell = "";
          treesitter = "󰔱";
        };
      };
    };
  };
}
