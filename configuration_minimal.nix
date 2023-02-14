{config, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
    ];
    
    boot.loader.systemd-boot.enable = true; # for UEFI ONLY
    boot.loader.efi.canTouchEfiVariables = true;
    # boot.loader.efi.enable = true; # somehow this command doesnt exist in docu

    boot.loader.grub = {
        enable = true;
        version = 2;
        device = "nodev";
        # fsIdentifier = "uuid";    # how grub identifes disks
        efiSupport = true;
        default = "0";
        /*
        extraEntries = ''
            menuentry "Windows 11" {
                chainloader (nvme0n1p1)
            }
            menuentry "NixOS" {
                chainloader (sda)
            }
        '';
        */
        useOSProber = true; # should automatically detect other OSs
        
    };


    # networking.useDHCP = false;
    # networking.interfaces.YOURINTERFACE.useDHCP = true;
    networking.networkmanager.enable = true;

    # enable dwm-status bar?
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
        /*
        # for normal dwm but with patches
        (self: super: {
            dwm = super.dwm.overrideAttrs (oldAttrs: rec {
                patches = [
                    (builtins.fetchurl https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-toggle-20200830.diff) # fullgaps
                    # (builtins.fetchurl https://dwm.suckless.org/patches/nextprev/nextprevtag.c) # next prev tag

                ];
            });
        })
        */
        # for custom dwm build
        (self: super: {
            dwm = super.dwm.overrideAttrs (_: { 
                src = builtins.fetchGit https://github.com/MentalOutlaw/dwm;
            });
        })
    ];
    console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
    };
    services.automatic-timezoned.enable = true;

    # add user
    users.users.chyq = {
        isNormalUser = true;
        home = "/home/chyq";
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
        gcc
        inconsolata # font
        gnumake
        unclutter # hides mouse cursor
    ];

    /*
    xinitrc = pkgs.writeTextFile {
        name = "xinitrc";
        executable = false;
        destination = "/home/chyq/.xinitrc";
        text = ''
        # hide mouse after idle
        unclutter -idle 3 &

        # custom theme
        xrdb ~/.Xresources &

        # run dwm
        exec dwm > ~/.dwm.log

        '';
    };
    */
    system.stateVersion = "22.11";
}