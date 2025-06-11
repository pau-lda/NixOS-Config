#!/usr/bin/env bash

src="./hosts/desktop-nixos/disko-config.nix"
if [ -f "$src" ]; then
    tempdest="/tmp/disk-config.nix"
    echo copying "$src" to "$tempdest"
    cp "$src" "$tempdest"
    nix run github:nix-community/disko --extra-experimental-features "nix-command flakes" -- --mode destroy,format,mount "$tempdest"
    nixos-generate-config --root /mnt
    #nixos-install
else
    echo "Source file $src does not exist."
fi
