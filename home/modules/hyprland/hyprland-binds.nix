# hyprland-binds.nix
{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = let
      workspaces = [
        "0"
        "1"
        "2"
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
        "SUPER, K, exec, $terminal"
        "SUPER, Q, killactive,"
        "SUPER&Escape, Q, exit,"
        "SUPER, F, exec, $fileManager"
        "SUPER, R, exec, rofi -show drun -show-icons"
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
      (lib.mapAttrsToList (key: direction: "SUPERSHIFT,${key},swapwindow,${direction}") directions);

    # Move/resize windows with SUPER + LMB/RMB and dragging
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
