{config, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
    ];
    
    boot.loader.systemd-boot.enable = true; # for UEFI ONLY
    # boot.loader.grub.device = "/dev/sda";   # for BIOS ONLY
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.enable = true;


    networking.useDHCP = false;
    netowrking.interfaces.YOURINTERFACE.useDHCP = true;

    # enable dwm
    displayManager.x11.enable = true;
    displayManager.x11.windowManager.dwm.enable = true;
    # start dwm on startup
    services.xserver.displayManager.dwm.enable = true;


    console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
    };
    keyboardLayout = "de";

    # add user
    users.users.eqily = {
        isNormalUser = true;
        home = "/home/eqily";
        extraGroups = [ "wheel"];
        initialPassword = "pw123";
    };

    # packages to install
    environment.systemPackages = with pkgs; [
        dwm
        git
        neofetch
        rxvt-unicode
    ];
}