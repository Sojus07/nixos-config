{ config, pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "fqbn207";
      userEmail = "fqbn207";
    };
  };
}
