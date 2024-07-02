# environment.nix
{ config, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      wine
      winetricks
      wineWowPackages.staging
      wineWowPackages.waylandFull
      git
      gh
      kitty
      bash
      vim
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      gcc
      rustup
      python311Packages.python
      python311Packages.torch
      python311Packages.torch-bin
      python311Packages.python-docx
      dotnet-sdk_8
      libnotify
      swww
      mako
      rofi-wayland
      cliphist
      wl-clip-persist
      wl-clipboard
      nixfmt-rfc-style
      xwaylandvideobridge
      grim
      slurp
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
