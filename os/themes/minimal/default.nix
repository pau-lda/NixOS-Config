{ pkgs, ... }:
{
  imports = [
    ../../os/features/basic.nix
    ../../os/features/nix.nix
    ../../os/features/users.nix
  ];
}