# telescope.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
  };
}
