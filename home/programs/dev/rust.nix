{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    # Additional recommended tools
    cargo-edit    # Adds `cargo add` command
    cargo-update  # For updating dependencies
    cargo-watch   # For watch-mode during development
  ];
}