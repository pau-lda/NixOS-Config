  { config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix

      # NixOS specific modules for hardware support
      ./hardware/x11.nix
      ./hardware/base.nix
      ./hardware/sound.nix
      ./hardware/nvidia.nix
      ./hardware/keyboard.nix
      ./hardware/mx_master.nix
      ./hardware/bluetooth.nix
    ];

  networking.hostName = "paudge";
  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "en_US.utf8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  networking.networkmanager.enable = true;

  users.users.pauli = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
  };


  # start of system specific configuration
  # ======================================

  hardware.x11.dpi = 125;
  hardware.x11.enable = true;

  hardware.sound.enable = true;
  hardware.nvidia.enable = true;
  hardware.bluetooth.enable = true;

  hardware.keyboard.enable = true;
  hardware.mx_master.enable = true;

  # Allow Home-Manager to control starting WMs via XSession
  xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    libinput.enable = true;
    displayManager = {
      defaultSession = "xsession";
      #autoLogin.user = "${username}";
      session = [{
        manage = "desktop";
        name = "xsession";
        start = ''
	        exec $HOME/.xsession
	      '';
      }];
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    settings.auto-optimise-store = true;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };


  # machine specific configuration
  home-manager.users.pauli = import ./machines/paudge.nix;


  # ====================================
  # end of system specific configuration
  system.stateVersion = "22.11";
}