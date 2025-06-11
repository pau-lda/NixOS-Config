{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vim
    vimPlugins.vim-vsnip
#    vimPlugins.vim-go
#    vimPlugins.vim-markdown
#    vimPlugins.vim-terraform
    xclip
  ];
}