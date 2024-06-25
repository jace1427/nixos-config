# hyprlock.nix
{pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "/home/jspidell/dir/nixos-config/wallpapers/eva-01.jpg";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "DP-1";
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 5;
          shadow_passes = 2;
        }
      ];
    };
  };
}
