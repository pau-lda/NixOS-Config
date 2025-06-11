{ pkgs, lib, ... }:
{
  imports = [
    ../minimal
    ../../../programs/applications/dwm.nix
    ../../../programs/applications/vscode.nix
    ../../../programs/dev/go.nix
    ../../../programs/dev/rust.nix
    ../../../programs/dev/gnumake.nix
  ];
}