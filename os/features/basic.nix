{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  time.timeZone = "Europe/Vienna";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };
  

  # coommon packages
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    dig
    neofetch
    htop
    iftop
    tcpdump
    inetutils
    bottom
    pstree
    tree
    pwgen
    screen
    ncdu
    parted
    file
    unzip
    lshw
    wget

  ];

  # install at least one Chinese font
  fonts.packages = with pkgs; [
    wqy_microhei
    inconsolata
  ];
}