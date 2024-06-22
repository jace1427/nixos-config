# waybar.nix
{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "DP-1"
          "DP-2"
          "DP-3"
        ];
        modules-left = ["cpu" "memory" "disk"];
        modules-center = ["hyprland/window"];
        modules-right = ["pusleaudio" "network" "clock"];
        "hyprland/window" = {
          max-length = 200;
          seperate-outputs = true;
        };
      };
    };
  };
}
