{ config, ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.name = "Sojus07";
      user.email = "Sojus07@0xcc01.de";
      init.defaultBranch = "master";
      core.editor = "nvim";
    };
  };
}
