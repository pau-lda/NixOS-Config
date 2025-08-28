{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "nvidia" ];
  boot.extraModulePackages = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/ROOT"; # Replace with your root partition
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "noatime" ];
    };

    "/home" = {
      device = "/dev/disk/by-label/ROOT"; # Same disk as root
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/ROOT"; # Same disk as root
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT"; # Replace with your EFI partition
      fsType = "vfat";
    };
  };

  swapDevices = [ ];
  
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
