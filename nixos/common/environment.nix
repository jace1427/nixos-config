# environment.nix
{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      wget
      wine
      winetricks
      wineWowPackages.staging
      wineWowPackages.waylandFull
      git
      bash
      gh
      openrazer-daemon
      vim
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      rustup
      gcc
      obsidian # TODO: put back in home.nix
      godot_4
      blender
      dotnet-sdk_8
      libnotify
      swww
      kitty
      rofi-wayland
      zoom-us
    ];

    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";
    };
  };
}
