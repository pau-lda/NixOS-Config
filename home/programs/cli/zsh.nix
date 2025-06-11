{config, lib, pkgs,...}:
with lib;
{
  home.packages = with pkgs; [zsh];
  home.file."p10k.zsh".source=./zsh/p10k.zsh;
  programs.zsh = {
    enable = true;

    autocd = true;
    enableCompletion = true;
    enableAutosuggestion = true;

    prezto = {
      enable = true;
      prompt.theme = "powerlevel10k";
    };

    initExtraFirst = ''
      if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/nix.sh"; fi
    '';

    initExtra = (mkMerge [
      ''
          # TODO: this isn't neccessarily wsl related anymore -- revise naming
          # TODO: use PM2 instead of ad-hoc shellscripts
          # Execute any custom wsl-service scripts
          for file in /etc/profile.d/**/*.wsl-service(DN); . $file
          for file in $HOME/.nix-profile/etc/profile.d/**/*.wsl-service(DN); . $file
      ''
    ]);
  };
}