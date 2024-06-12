# home.nix
{
  inputs,
  lib,
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ./modules/fish.nix
    ./modules/git.nix
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

  home.packages = with pkgs; [
    vscode
    # obsidian TODO
    steam
    gamemode
    vkbasalt
    gamescope
    protonup-qt
    spotify
    alejandra
    discord
    wowup-cf
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}