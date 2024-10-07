# home.nix
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ ./modules/default.nix ];

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
      EDITOR = "code";
      MOZ_ENABLE_WAYLAND = 1;
    };
    sessionPath = [ "$HOME/.npm-global/bin" ];
  };

  # Enable packages
  programs.home-manager.enable = true;

  stylix.targets = {
    rofi.enable = false;
    vscode.enable = false;
  };

  home.packages = with pkgs; [
    firefox
    steam
    prismlauncher
    gamescope
    spotify
    vesktop
    wowup-cf
    obsidian
    godot_4
    blender
    zoom-us
    vscode
    jq
    appimage-run
    gimp
    ungoogled-chromium
    reaper
    lmms
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
