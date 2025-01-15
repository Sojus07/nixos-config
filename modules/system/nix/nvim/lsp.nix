{
  pkgs,
  lib,
  ...
}: {
  vim = {
    languages = {
      clang = {
        enable = true;
        dap.enable = true;
        treesitter.enable = true;
        lsp.enable = true;
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
    };
  };
}
