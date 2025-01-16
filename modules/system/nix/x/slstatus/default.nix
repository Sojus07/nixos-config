{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (slstatus.overrideAttrs (_: { src = ./source/slstatus; }))    
  ];  
}
