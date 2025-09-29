{ pkgs, ... }:
{
  imports = [
    ../minimal
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = false;
  };
}