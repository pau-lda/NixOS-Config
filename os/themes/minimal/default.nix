{ pkgs, ... }:
{
  imports = [
    ../../features/basic.nix
    ../../features/nix.nix
    ../../features/users.nix
  ];
}