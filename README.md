# NIXOS-CONFIG

My NixOS configuration, built with flakes and home-manager (as a NixOS module). This is a major WIP and gets updated with (breaking) changes often.

## Structure

- `home`
  - `modules`
    Contains modules for home-manager settings
    - `hyprland`
      Contains Hyprland home-manager settings
    - `shell`
      Contains shell related settings
      - `nvim`
        Contains neovim home-manager settings
  - `home.nix`
    Entry point for home-manager

- `nixos`
  - `common`
    - Contains seperated files for each major configuration, `programs.nix`, `services.nix`, etc
  - `configuration.nix`
    - Contains the main configuration for the system

- `flake.nix`
  The main entry point of the configuration. Imports unstable and others, calls into `nixos/configuration.nix`, and `home/home.nix`

- `rebuild.sh`
  Checks configuration with alejandra, `nixos-rebuild switch`'s, and if successful, pushes to the github repo

- `wallpapers`
  [Sourced from here](https://github.com/dharmx/walls/tree/main)
