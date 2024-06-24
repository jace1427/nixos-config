# waybar.nix
{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        height = 30;
        output = [
          "DP-1"
          "DP-2"
          "DP-3"
        ];
        modules-left = ["cpu" "memory" "disk"];
        modules-center = ["hyprland/window"];
        modules-right = ["pusleaudio" "clock"];
        "hyprland/window" = {
          max-length = 200;
          seperate-outputs = true;
        };
      };
    };
  };
}
