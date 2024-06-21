# environment.nix
{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      wine
      winetricks
      wineWowPackages.staging
      wineWowPackages.waylandFull
      git
      gh
      foot
      bash
      vim
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      gcc
      rustup
      dotnet-sdk_8
      libnotify
      swww
      mako
      rofi-wayland
    ];

    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";
    };
  };
}
