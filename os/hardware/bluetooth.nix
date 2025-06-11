{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
}