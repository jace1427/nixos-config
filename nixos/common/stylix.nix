{ pkgs, config, ... }:
{
  stylix = {
    enable = true;
    image = ../../wallpapers/city-02.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    targets.grub.useImage = true;

    fonts = {
      sizes = {
        applications = 14;
        terminal = 14;
        desktop = 14;
        popups = 14;
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
