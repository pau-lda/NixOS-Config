{ config, pkgs, ... }:
let
  hosts = import ../../config/hosts.nix;
in

{
  networking.hostName = hosts.workstation.hostname;
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
}