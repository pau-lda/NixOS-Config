{ pkgs, lib, ... }:
{
  imports = [
    ../../minimal
    ../../../programs/fonts
    #../../../features/application/terminator.nix
  ];

  home.packages = with pkgs; [];
}