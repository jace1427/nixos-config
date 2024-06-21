# home.nix
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/default.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "jspidell";
    homeDirectory = "/home/jspidell";
  };

  # Enable packages
  programs.home-manager.enable = true;
  programs.gamemode.enable = true;

  home.packages = with pkgs; [
    steam
    vkbasalt
    gamescope
    protonup-qt
    spotify
    alejandra
    discord
    wowup-cf
    obsidian
    godot_4
    blender
    zoom-us
    lf
    btop
  ];

  colorScheme = inputs.nix-colors.colorSchemes.Dracula;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
