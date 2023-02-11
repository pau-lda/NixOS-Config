{config, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
    ];
    
    boot.loader.systemd-boot.enable = true; # for UEFI ONLY
    # boot.loader.grub.device = "/dev/sda";   # for BIOS ONLY
    boot.loader.efi.canTouchEfiVariables = true;
    # boot.loader.efi.enable = true; # somehow this command doesnt exist in docu


    # networking.useDHCP = false;
    # networking.interfaces.YOURINTERFACE.useDHCP = true;
    networking.networkManager.enable = true;

    # enable dwm
    services.xserver.enable = true;
    services.xserver.displayManager.dwm.enable = true;
    services.xserver.displayManager.lightdm.enable = false;
    services.xserver.displayManager.startx.enable = true;
    displayManager.x11.enable = true;
    displayManager.x11.windowManager.dwm.enable = true;
    # start dwm on startup
    


    console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
    };
    keyboardLayout = "de";
    time.timeZone = "Europe/Vienna";

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
        vim
    ];
}