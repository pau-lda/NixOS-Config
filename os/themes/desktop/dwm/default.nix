{ pkgs, ... }:
{
  imports = [
    ../minimal
  ];
  services.xserver = {
    enable = true;
    displayManager.x11.enable = true;
    displayManager.x11.windowManager.dwm.enable = true;
    windowManager.dwm.enable = true; 
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
  };
}