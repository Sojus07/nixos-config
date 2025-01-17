{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    languages = {
      clang = {
        enable = true;
        dap.enable = true;
        treesitter.enable = true;
        lsp.enable = true;
      };
      python = {
        enable = true;
      };
      go = {
        enable = true;
      };
      lua = {
        enable = true;
      };
      rust = {
        enable = true;
        dap.enable = true;
        format.enable = true;
        lsp.enable = true;
      };
      html = {
        enable = true;
        treesitter = {
          enable = true;
          autotagHtml = true;
        };
      };
      css = {
        enable = true;
        treesitter.enable = true;
        lsp.enable = true;
      };
      assembly = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      bash = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      ts = {
        enable = true;
        extraDiagnostics.enable = true;
        treesitter.enable = true;
        lsp.enable = true;
      };
      nix = {
        enable = true;
        extraDiagnostics = {
          enable = true;
        };
        format = {
          enable = true;
          type = "alejandra";
        };
        lsp.enable = true;
        treesitter.enable = true;
      };
      trouble = {
        enable = true;
      };
    };
  };
}
