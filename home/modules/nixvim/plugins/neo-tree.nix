# neo-tree.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
  };
}
