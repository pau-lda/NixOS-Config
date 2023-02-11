{config,lib,pkgs,...}:

with lib;
{
     options.modules.dwm = {
        enable = mkOption {type = types.bool; default = false; };
    }

    config = mkIf config.modules.dwn.enable {
        # only if 'enable' = true -> make these configs

        home.packages = with pkgs; [
            dwm
        ];

        /*
        nixpkgs.overlays = [
            (self: super: {
                dwm = super.dwm.overideAttrs(_: {
                    src = builtins.fetchGit {
                        url = "https://git.suckless.org/dwm";
                        ref = "master";

                    }
                })
            })
        ]
        */

        #services.xserver.displayManager.lightdm.enable = false;
        #services.xserver.displayManager.startx.enable = true; 

        displayManager.x11.enable = true;
        displayManager.x11.windowManager.dwm.enable = true;
        services.xserver.windowManager.dwm.enable = true; 
    }
    

}