{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    ../../os/hardware/nvidia.nix
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
  boot.loader.grub = {
    efiSupport = true;
    enable = true;
    device = "nodev"; # Use "nodev" for EFI systems
    useOSProber = true;
  };
  boot.loader.efi = {
    canTouchEfiVariables = true;
  };
  system.stateVersion = "25.05";
}
