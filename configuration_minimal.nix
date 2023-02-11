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
    services.dwm-status = {
        enable = true;
        order = [
            "cpu_load"
            "audio"
            "network"
            "time"
        ];
    };

    services.xserver = {
        enable = true;
        layout = "de";
        displayManager = {
            defaultSession = "dwm";
            
            lightdm.enable = false;
            startx.enable = true;

            # dwm = [{
            #    enable = true;
            # }];
            session = [{
                manage = "window";
                name = "dwm";
                #start = ''exec $HOME/.xsession'';
                start = ''exec dwm'';
            }]; 
        };
        desktopManager = {
            runXdgAutostartIfNone = true;   # needed if no dm but only a wm
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

    nixpkgs.overlays = [
        (self: super: {
            dwm = super.dwm.overrideAttrs (oldAttrs: rec {
                patches = [
                    (builtins.fetchurl https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff) # fullgaps
                    (builtins.fetchurl https://dwm.suckless.org/patches/nextprev/nextprevtag.c) # next prev tag

                ];
            });
        })
    ];
    console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
    };
    services.automatic-timezoned.enable = true;

    # add user
    users.users.eqily = {
        isNormalUser = true;
        home = "/home/chqir";
        extraGroups = [ "wheel" "networkmanager" ];
        initialPassword = "chel";
    };

    # packages to install
    environment.systemPackages = with pkgs; [
        dwm
        dwm-status
        st
        git
        neofetch
        rxvt-unicode
        vim
        firefox
        wget
        gcc
        incosolata # font
        make
    ];

    system.stateVersion = "22.11";
}