# which-key.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.which-key = {
    enable = true;
  };
}
