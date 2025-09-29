{config,lib,pkgs,...}:
{
  wayland.windowManager.hyprland.enable = true;
  #wayland.windowManager.hyprland.plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    # "/absolute/path/to/plugin.so"
  #];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
  };
  wayland.windowManager.hyprland.systemd.variables = ["--all"];
  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 
}