{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      treesitter-context = {
        enable = true;
      };
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          c
          cpp
          rust
          bash
          json
          lua
          make
          markdown
          nix
          toml
          vim
          vimdoc
          xml
          yaml
        ];
      };
    };
  };
}
