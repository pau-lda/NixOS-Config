{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    ../../hardware/gpu/nvidia.nix
    ../../os/themes/desktop/dwm
  ];

  # Enable OpenGL
  hardware.graphics.enable = true;
  nixpkgs.config.allowUnfree = true;

  # fix the date sync issue in dual boot with win11
  time.hardwareClockInLocalTime = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    onlyoffice-bin
  ];

  #programs.ssh.startAgent = true;
  boot.loader.grub.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only
  system.stateVersion = "25.05";
}
