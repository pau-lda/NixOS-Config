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

    #enable dwm-status bar?
    services.dwm-status.enable = true;

    xserver = {
        enable = true;
        displayManager = {
            defaultSession = "dwm";
            runXdgAutostartIfNone = true;   # needed if no dm but onyl a wm

            lightdm.enable = false;
            startx.enable = true;

            # dwm = [{
            #    enable = true;
            # }];
            session = [{
                manage = "windows";
                name = "dwm";
                start = ''exec $HOME/.xsession'';
            }]; 
        };
        windowManager = {
            awesome = {
                enable = false;
                luaModules = [
                    # add here
                ];
            };

            dwm = {
                enable = true;
                /*
                package = pkgs.dwm.overrideAttrs (oldAttrs: rec {
                    patches = [
                        (super.fetchpatch {
                            url = "https://git.suckless.org/dwm";
                            sha256 = "1ld1z3fh6p5f8gr62zknx3axsinraayzxw3rz1qwg73mx2zk5y1f";
                        })
                    ];
                });
                */
            };

        };
        /*
        videoDriver = [
            "nvidia"
            "nvidiaLegacy340"
            "amdgpu"
        ];
        */

    };

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

    system.stateVersion = "22.11";
}