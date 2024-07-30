{ pkgs, config, ... }:
{
  programs.rofi = {
    enable = true;
    theme = "solarized";
    package = pkgs.rofi-wayland;
  };
}
