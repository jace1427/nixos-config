# home.nix
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./modules/default.nix];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "jspidell";
    homeDirectory = "/home/jspidell";
    sessionVariables = {
      EDITOR = "nvim";
      MOZ_ENABLE_WAYLAND = 1;
    };
  };

  # Enable packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    steam
    prismlauncher
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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
