# telescope.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
  };
}
