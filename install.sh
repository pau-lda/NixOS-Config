#!/usr/bin/env bash

src="$HOME/NixOS-Config"
if [ "$linux_os" = "nixos" ]; then
    dst="/etc/nixos"
    sudo ln -sfn "$src/flake.nix" "$dst/flake.nix"
    sudo ln -sfn "$src/flake.lock" "$dst/flake.lock"
    sudo ln -sfn "$src/hosts" "$dst/hosts"
    sudo ln -sfn "$src/home" "$dst/home"
    sudo ln -sfn "$src/config" "$dst/config"
    sudo ln -sfn "$src/nixos" "$dst/nixos"
    sudo ln -sfn "$src/pkgs" "$dst/pkgs"
    sudo ln -sfn "$src/overlays" "$dst/overlays"
    sudo ln -sfn "$src/lib" "$dst/lib"
fi
echo "generated symlinks to $dst"
echo "running nixos-rebuild switch"
sudo nixos-rebuild switch
# or
# home-manager switch for non NixOS systems