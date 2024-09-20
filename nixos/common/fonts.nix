{ pkgs, config, ... }:
{
  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "Terminus" ]; }) ];
}
