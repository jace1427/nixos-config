# hyprland-decoration.nix
{...}: {
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 10;
      active_opacity = 0.9;
      inactive_opacity = 0.9;
      fullscreen_opacity = 0.9;

      drop_shadow = true;
      shadow_range = 12;
      shadow_render_power = 3;
      shadow_offset = "3 3";
      # "col.shadow" = "rgba(1a1a1aee)";

      blur = {
        enabled = true;
        size = 1;
        passes = 2;
        vibrancy = 0.1696;
        ignore_opacity = true;
        popups = true;
        xray = true;
      };
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
  };
}
