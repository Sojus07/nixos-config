{ pkgs, lib,...}:
{
  programs.nvf.settings.vim = {
    snippets = {
      luasnip = {
        enable = true;
        loaders = "require('luasnip.loaders.from_snipmate').lazy_load()";
        #providers = [
        #  "friendly-snippets"
        #  "crates-nvim"
        #  "lspkind"
        #  "lspsaga"
        #  "rustaceanvim"
        #];
        setupOpts = {
          enable_autosnippets = false;
        };
      };
    };
  };
}
