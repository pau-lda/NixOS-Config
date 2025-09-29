{ pkgs, lib, ... }:
{
  imports = [
    ../minimal
    ../../../programs/applications/hyprland.nix
    ../../../programs/applications/vscode.nix
    ../../../programs/applications/alacritty.nix
    ../../../programs/applications/kitty.nix
    ../../../programs/dev/go.nix
    ../../../programs/dev/rust.nix
    ../../../programs/dev/gnumake.nix
  ];
}