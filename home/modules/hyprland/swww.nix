{ ... }:
{
  # added to packages in home.nix
  xdg.dataFile."change_wallpaper.sh" = {
    enable = true;
    text = ''
      set -e
      while true; do
        BG=`find ${../../../wallpapers/manga} -name "*.jpg" -o -name "*.png" | shuf -n1`
        if pgrep swww-daemon >/dev/null; then
          swww img "$BG" \
            --transition-fps 60 \
            --transition-duration 2 \
            --transition-type random \
            --transition-pos top-right \
            --transition-bezier .3,0,0,.99 \
            --transition-angle 135 || true
        else
          (swww-daemon 1>/dev/null 2>/dev/null &) || true
        fi
        sleep 1800
      done
    '';
  };
}
