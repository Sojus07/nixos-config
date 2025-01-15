{
  pkgs,
  lib,
  ...
}: {
  vim = {
    filetree = {
      neo-tree = {
        enable = true;
        setupOpts = {
          enable = true;
          enable_git_status = true;
          enable_diagnostics = true;
          enable_refresh_on_write = true;
          auto_clean_after_session_restore = true;
          git_status_async = true;
        };
      };
    };
  };
}
