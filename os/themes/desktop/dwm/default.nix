{ pkgs, ... }:
{
  imports = [
    ../minimal
  ];
  services.xserver = {
    enable = true;
    windowManager.dwm.enable = true;
    displayManager.startx.enable = true; # use startx to override default lightdm
  };

  # Configure keymap in X11
}