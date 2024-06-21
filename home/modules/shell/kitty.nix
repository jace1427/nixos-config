# kitty.nix
{
  pkgs,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      size = 14;
    };
  };
}
