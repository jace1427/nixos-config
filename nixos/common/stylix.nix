{ pkgs, config, ... }:
{
  stylix = {
    enable = true;
    image = ../../wallpapers/a_street_with_buildings_and_signs.png;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/outrun-dark.yaml";
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
