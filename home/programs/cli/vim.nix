{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
  };

  home.file.".config/nvim".source = pkgs.fetchgit {
    url = "https://github.com/pau-lda/nvim-config.git";
    rev = "HEAD";
    leaveDotGit = true;
    deepClone = true;
    hash = "sha256-ssksgBPNupBv6ccU7uyj2VZyyAcOktLrfwV6BzIRark=";
  };
}
