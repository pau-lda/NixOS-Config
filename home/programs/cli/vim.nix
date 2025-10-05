{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    #package = pkgs.neovim-unwrapped;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymLink "${config.home.homeDirectory}/dotfiles/nvim/";
    recursive = true;
  };
}
