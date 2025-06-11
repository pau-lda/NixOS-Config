{ pkgs, lib, ... }:
{
  imports = [
    ../../programs/cli/vim.nix
    #../../programs/cli/autojump.nix
    ../../programs/cli/zsh.nix
    #../../programs/cli/bat.nix
    ../../programs/cli/common.nix
    #../../programs/cli/fzf.nix
    ../../programs/cli/git.nix
    #../../programs/cli/jq.nix
    #../../programs/cli/lsd.nix
    #../../programs/cli/powerline-go.nix
    #../../programs/cli/ssh.nix
    #../../programs/cli/ripgrep.nix
    ../../programs/cli/home-manager.nix
    ../../programs/cli/zip.nix
    #../../programs/cli/wireguard.nix
  ];
  manual.html.enable = true;
}