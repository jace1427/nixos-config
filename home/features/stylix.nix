# stylix.nix
{
  pkgs,
  config,
  ...
}: {
  stylix.base16Scheme = config.colorScheme;
  stylix.image = ../../wallpapers/a_city_with_a_pyramid_over_it.png;
}
