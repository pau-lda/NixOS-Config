{config,lib,pkgs,...}:

with lib;
{
    options.modules.awesome = {
        enable = mkOption       {type = types.bool; default = false; };
    };

    config = mkIf config.modules.awesome.enable {
        home.packages = with pkgs; [
            awesome 
            rofi 
            fantasque-sans-mono 
            maim
        ];

        home.file.".config/awesome" = {
            recursive = true;
            source = ./awesome;
        }
    }
}