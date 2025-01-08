{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim = {
    plugins = {
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
