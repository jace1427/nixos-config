# hyprlock.nix
{ pkgs, config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
        hide_cursor = true;
        no_fade_in = false;
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = "/home/jspidell/dir/nixos-config/wallpapers/solarized/a_large_body_of_water_with_clouds_in_the_sky.jpg";
          blur_passes = 1;
          blur_size = 5;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "DP-3";
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 5;
          shadow_passes = 2;
        }

        {
          size = "200, 50";
          position = "0, -80";
          monitor = "HDMI-A-1";
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 5;
          shadow_passes = 2;
        }
      ];
    };
  };
}
