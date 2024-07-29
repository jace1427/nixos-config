{
  pkgs,
  config,
  wallpaper,
  ...
}:
{
  stylix = {
    enable = true;
    image = ../../wallpapers/solarized/a_red_sun_over_mountains.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    targets.grub.useImage = true;

    fonts = {
      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 12;
        popups = 12;
      };

      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "Terminus" ]; };
        name = "Terminus";
      };
      sansSerif = config.stylix.fonts.monospace;
      serif = config.stylix.fonts.monospace;
    };
  };
}
