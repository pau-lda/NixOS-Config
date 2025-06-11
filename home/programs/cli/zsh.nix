{config, lib, pkgs,...}:
with lib;
{
  home.packages = with pkgs; [oh-my-zsh];
  programs.zsh = {
    enable = true;
    initExtra = ''
      # Source Oh My Zsh
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      source $ZSH/oh-my-zsh.sh
    '';
  };
}