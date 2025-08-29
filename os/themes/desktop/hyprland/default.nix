{ pkgs, ... }:
{
  imports = [
    ../minimal
  ];

  programs.hyprland.enable = {
    enable = true;
    withUWSM = true;
  } 
}