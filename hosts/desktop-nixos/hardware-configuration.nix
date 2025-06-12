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
      device = "/dev/disk/by-uuid/db52f483-c643-49bd-aace-a25841ab20c4"; # Replace with your root partition UUID
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "noatime" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/db52f483-c643-49bd-aace-a25841ab20c4"; # Same UUID as root
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/db52f483-c643-49bd-aace-a25841ab20c4"; # Same UUID as root
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

    "/boot" = {
      device = "/dev/disks/by-uuid/64aa-398c"; # Replace with your EFI partition UUID
      fsType = "vfat";
    };
  };

  swapDevices = [ ];
  
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
