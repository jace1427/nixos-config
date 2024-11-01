# environment.nix
{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # system
      wine
      winetricks
      wineWowPackages.staging
      wineWowPackages.waylandFull
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      xwaylandvideobridge
      git
      gh
      kitty
      bash
      gcc
      dotnet-sdk_8
      nodejs_22
      rustup
      vim
      vscode
      libnotify
      mako
      rofi-wayland
      cliphist
      wl-clip-persist
      wl-clipboard
      grim
      slurp
      unzip
      nixfmt-rfc-style
      lz4
    ];

    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";
      MOZ_ENABLE_WAYLAND = 1;
    };

    pathsToLink = [ "/share/zsh/" ];
  };
}
