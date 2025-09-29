{ pkgs, ... }:
{
  imports = [
    ../../minimal
  ];
  /*
  i18n.inputMethod = {
    type = "ibus";
    enable = true;
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };
  */
  console.keymap = "de"
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
  };

  environment.systemPackages = with pkgs; [
    firefox
  ];
}