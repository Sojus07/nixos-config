{ pkgs, lib,...}:
{
  programs.nvf.settings.vim = {
    snippets = {
      luasnip = {
        enable = true;
        providers = [
          "friendly-snippets"
          "vimPlugins.vim-snippets"
          "crates-nvim"
          "lspkind"
          "lspsaga"
          "rustaceanvim"
        ];
        setupOpts = {
          enable_autosnippets = true;
        };
      };
    };
  };
}
