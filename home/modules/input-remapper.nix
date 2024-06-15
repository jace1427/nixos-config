# input-remapper.nix
{
  pkgs,
  config,
  ...
}: {
  programs.input-remapper =
  {
    enable = true;
  }
}
