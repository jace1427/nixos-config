# hyprland.nix
{
  pkgs,
  config,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      monitor = [
        "DP-3,preferred,0x0,auto"
        "DP-1,preferred,1920x0,auto"
        "DP-2,preferred,-1920x0,auto"
        "HDMI-A-1,3840x2160@120.00Hz,0x0,2"
      ];

      exec-once = [
        "mako"
        "waybar"
        "hypridle"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      env = [
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
      ];

      cursor.inactive_timeout = 4;

      decoration = {
        rounding = 10;
        active_opacity = 0.8;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1;

        drop_shadow = true;
        shadow_range = 12;
        shadow_render_power = 3;
        shadow_offset = "3 3";

        blur = {
          enabled = true;
          size = 9;
          passes = 3;
          vibrancy = 0.1696;
          ignore_opacity = true;
          popups = true;
          xray = true;
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.165, 0.84, 0.44, 1";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      general = {
        gaps_in = 25;
        gaps_out = 25;

        border_size = 1;
        resize_on_border = true;

        allow_tearing = false;

        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
        split_width_multiplier = 1.35;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
        new_window_takes_over_fullscreen = 2;
        disable_splash_rendering = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 2;
        sensitivity = -0.6; # (-1.0, 1.0), 0 means no modification.
        accel_profile = "flat";
      };

      gestures = {
        workspace_swipe = false;
      };

      layerrule = [
        "animation fade,waybar"
        "blur,waybar"
        "ignorezero,waybar"

        "blur,notifications"
        "ignorezero,notifications"

        "blur,rofi"
        "ignorezero,rofi"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*" # You'll probably like this.
        "opacity 1.0 override 1.0 override 1.0 override,title:(.*)(YouTube)(.*)"
        "opacity 1.0 override 1.0 override 1.0 override,title:(.*)(World of Warcraft)(.*)"
        "opacity 1.0 override 1.0 override 1.0 override,title:(.*)(Minecraft)(.*)"
      ];

      workspace = [
        "1, monitor:DP-2, default:true, persistent:true, defaultName:1"
        "2, monitor:DP-2, persistent:true, defaultName:2"
        "3, monitor:DP-3, default:true, persistent:true, defaultName:3"
        "4, monitor:DP-3, persistent:true, defaultName:4"
        "5, monitor:DP-1, default:true, persistent:true, defaultName:5"
        "6, monitor:DP-1, persistent:true, defaultName:6"
      ];
    };
  };
}
