{
  config,
  pkgs,
  ...
}: {
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "xdph"
          "gtk"
        ];
        "org.freedesktop.portal.FileChooser" = ["xdg-desktop-portal-gtk"];
      };
    };
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };
}
