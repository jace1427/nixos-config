# stylix.nix
{
  pkgs,
  config,
  ...
}: {
  stylix.image = ../../wallpapers/a_city_with_a_pyramid_over_it.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
}
