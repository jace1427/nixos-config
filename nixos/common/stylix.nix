{ pkgs, config, ... }:
{
  stylix = {
    enable = true;
    image = ../../wallpapers/nord/a_city_skyline_with_a_tall_tower.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
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
        name = "FiraCode Nerd Font";
      };
      sansSerif = config.stylix.fonts.monospace;
      serif = config.stylix.fonts.monospace;
    };
  };
}
