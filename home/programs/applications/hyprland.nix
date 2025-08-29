{config,lib,pkgs,...}:
{
  wayland.windowManager.hyprland.enable = true;
  #wayland.windowManager.hyprland.plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    # "/absolute/path/to/plugin.so"
  #];
}