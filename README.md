# NixOS-Config

My own NixOS config with flakes. Contains hosts for work, wsl, desktop machine, ...


## Usage

Add or remove hosts and configure to your liking.

Run `nixos-rebuild switch --flake github:pau-lda/NixOS-Config#your-host`

Or copy the flake and its requisites with install.sh to /etc/nixos and run `nixos-rebuild switch`.

When installing the os on another disk. First mount /boot and /root to /mnt, or use the diskos mount feature. 
Then run `nixos-install --flake github:pau-lda/NixOS-Config#your-host`


## Pre-rebuild

The `partition.sh` is used for my desktop-machine which uses nixos. Using the `hosts/desktop-nixos/disko-config.nix` it partitions my ssd.


## Structure

```md
├─ config
│  ├─ dwm
│  │  └─ config.def.h
│  ├─ vim
│  │  └─ vimrc
│  ├─ hosts.nix
│  └─ users.nix
├─ home-manager
│  └─ homemanager.nix
├─ home -> configs for all /home related settings
│  ├─ programs
│  │  ├─ applications
│  │  │  └─ applications such as vscode
│  │  ├─ cli
│  │  │  └─ cli programs such as git
│  │  ├─ dev
│  │  │  └─ development programs such as gnumake, go, ...
│  │  └─ fonts
│  └─ themes
│     ├─ desktop
│     │  ├─ dwm
│     │  │  └─ default.nix
│     │  └─ minimal
│     │     └─ default.nix
│     └─ minimal
│        └─ default.nix
├─ hosts -> add more hosts, like work, wsl, ...
│  └─ desktop-nixos
│     ├─ configuration.nix
│     ├─ hardware-configuration.nix
│     ├─ home.nix
│     └─ networking.nix
├─ os -> configs for all os related settings
│  ├─ features
│  │  ├─ basic.nix
│  │  ├─ nix.nix
│  │  └─ users.nix
│  ├─ hardware
│  │  └─ hardware configs, such as bluetooth
│  └─ themes
│     ├─ desktop
│     │  ├─ dwm
│     │  │  └─ default.nix
│     │  └─ minimal
│     │     └─ default.nix
│     └─ minimal
│        └─ default.nix
├─ flake.nix
└─ install.sh
```
