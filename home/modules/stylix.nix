# stylix.nix
{
  pkgs,
  config,
  ...
}: {
  stylix.base16Scheme = config.colorScheme;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
}
