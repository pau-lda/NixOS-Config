{config,lib,pkgs,...}:
{

        #home.packages = with pkgs; [dwm];
        xsession = {
            enable = true;
            windowManager.command = "dwm";  # Ensures DWM starts for your user
        };

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

#        displayManager.x11.enable = true;
#        displayManager.x11.windowManager.dwm.enable = true;
    

}