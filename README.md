# NIXOS-CONFIG

## Structure

- `home`
  - `modules`
    Contains modules for home-manager settings.

  - `home.nix`
    Entry point for home-manager. Contains imports for modules.

- `nixos`
  - `common`
    - Contains seperated files for each major configuration, `programs.nix`, `services.nix`, etc.
  - `configuration.nix`
    - Contains the main configuration for the system.

- `flake.nix`
  The main entry point of the configuration. Imports unstable and others, calls into `nixos/configuration.nix`.

- `rebuild.sh`
  Rebuild script

## Wallpapers

[Link](https://github.com/dharmx/walls/tree/main)
