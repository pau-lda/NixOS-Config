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
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
  };

  # Autostart dwm with .xinitrc (if not using a display manager)
  environment.etc."xinitrc".text = ''
    #!/bin/sh
    exec dwm
  '';
}