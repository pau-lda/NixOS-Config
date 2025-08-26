{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty
  ];

  #home.file.".config/alacritty".source = pkgs.fetchgit {
  #  url = "https://github.com/pau-lda/alacritty-config.git";
  #  rev = "main";
  #  leaveDotGit = true;
  #  deepClone = true;
  #  hash = "sha256-ssksgBPNupBv6ccU7uyj2VZyyAcOktLrfwV6BzIRark="
  #}
    
}