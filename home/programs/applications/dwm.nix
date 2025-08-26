{config,lib,pkgs,...}:
{
  # Autostart dwm with .xinitrc (if not using a display manager)
  home.file.".xinitrc".text = ''
    #!/bin/sh
    exec dwm
  '';
}