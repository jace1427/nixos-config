# hyprland-binds.nix
{ lib, ... }:
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
      in
      [
        "SUPER, T, exec, kitty"
        "SUPER, Q, killactive,"
        "SUPER, F, exec, firefox"
        "SUPER, V, exec, vesktop"
        "SUPER, D, exec, lf"
        "SUPER, Space, exec, rofi -show drun -show-icons"
        "SUPERSHIFT, Q, exit,"
        "SUPER, F1, exec, ~/.config/hypr/gamemode.sh"
        "SUPERALT, L, exec, hyprlock"
        "SUPERSHIFT, S, exec, grim -g \"$(slurp)\""
        "SUPERSHIFT, F, fullscreen, 1"
      ]
      ++
        # Change workspace
        (map (n: "SUPER,${n},workspace,name:${n}") workspaces)
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
