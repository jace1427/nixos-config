# environment.nix
{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wget
    wine
    winetricks
    wineWowPackages.staging
    wineWowPackages.waylandFull
    git
    gh
    openrazer-daemon
    vim
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    rustup
    gcc
    obsidian # TODO: put back in home.nix
    godot_4
  ];
}
