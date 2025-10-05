{config,lib,pkgs,...}:
{
  wayland.windowManager.hyprland.enable = true;
  #wayland.windowManager.hyprland.plugins = [
    # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    # "/absolute/path/to/plugin.so"
  #];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, Q, exec, kitty"
    ];
    input = {
        kb_layout = "at";
        kb_variant = "nodeadkeys";
        follow_mouse = 1;
        repeat_delay = 500;
        sensitivity = 0;
        float_switch_override_focus = 2;
      };
  };
  wayland.windowManager.hyprland.systemd.variables = ["--all"];
  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 

  xdg.configFile."hyprland" = {
    source = config.lib.file.mkOutOfStoreSymLink "${config.home.homeDirectory}/dotfiles/hyprland";
    recursive = true;
  };
}