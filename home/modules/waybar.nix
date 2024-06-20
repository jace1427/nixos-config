# waybar.nix
{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
  };
}
