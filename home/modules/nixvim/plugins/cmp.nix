# cmp.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.cmp = {
    enable = true;
  };
}
