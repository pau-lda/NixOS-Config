{ config, pkgs, ... }:
let
  users = import ../../config/users.nix;
in
{
  imports = [
    ../../home/desktop/desktop/dwm
    ../../home/themes/desktop/dwm
  ];

  home.packages = with pkgs; [
    #rclone
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = "24.11";
  };

}