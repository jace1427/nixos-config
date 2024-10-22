# hyprland-binds.nix
{
  pkgs,
  lib,
  config,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    bind =
      let
        workspaces = [
          "1"
          "2"
          "3"
          "4"
          "5"
          "6"
        ];
        directions = rec {
          left = "l";
          right = "r";
          up = "u";
          down = "d";
          h = left;
          l = right;
          k = up;
          j = down;
        };
        switch = lib.getExe (
          pkgs.writeShellScriptBin "switch" ''
            id=$(hyprctl activeworkspace -j | jq '.id')

            if [ $1 -eq 1 ]; then
                if [ $id -eq 1 ]; then
                    hyprctl dispatch workspace 2
                elif [ $id -eq 2 ]; then
                    hyprctl dispatch workspace 1
                else
                    hyprctl dispatch focusmonitor DP-2
                fi
            elif [ $1 -eq 2 ]; then
                if [ $id -eq 3 ]; then
                    hyprctl dispatch workspace 4
                elif [ $id -eq 4 ]; then
                    hyprctl dispatch workspace 3
                else
                    hyprctl dispatch focusmonitor DP-3
                fi
            else
                if [ $id -eq 5 ]; then
                    hyprctl dispatch workspace 6
                elif [ $id -eq 6 ]; then
                    hyprctl dispatch workspace 5
                else
                    hyprctl dispatch focusmonitor DP-1
                fi
            fi
          ''
        );
      in
      [
        "SUPER, T, exec, kitty"
        "SUPER, Q, killactive,"
        "SUPER, F, exec, firefox"
        "SUPER, D, exec, vesktop"
        "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "SUPER, O, exec, obsidian"
        "SUPER, C, exec, code"
        "SUPER, Space, exec, rofi -show drun -show-icons"
        "SUPER, 1, exec, ${switch} 1"
        "SUPER, 2, exec, ${switch} 2"
        "SUPER, 3, exec, ${switch} 3"
        "SUPER, F1, exec, ~/.config/hypr/gamemode.sh"
        "SUPERSHIFT, Q, exit,"
        "SUPERSHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
        "SUPERSHIFT, F, fullscreen, 1"
        "SUPERALT, L, exec, hyprlock"
        "SUPERALT, up, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        "SUPERALT, down, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
      ]
      ++
        # Change workspace
        (map (n: "SUPERALT,${n},workspace,name:${n}") workspaces)
      ++
        # Move focus
        (lib.mapAttrsToList (key: direction: "SUPER,${key},movefocus,${direction}") directions)
      ++
        # Move window to workspace
        (map (n: "SUPERSHIFT,${n},movetoworkspacesilent,name:${n}") workspaces)
      ++
        # Swap windows
        (lib.mapAttrsToList (key: direction: "SUPERSHIFT,${key},movewindow,${direction}") directions);

    # Move/resize windows with SUPER + LMB/RMB and dragging
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
