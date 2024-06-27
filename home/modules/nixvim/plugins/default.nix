# default.nix
{ pkgs, ... }:
{
  imports = [
    ./autopairs.nix
    ./cmp.nix
    ./conform.nix
  ];
  programs.nixvim.plugins = {
    # detect tabstop automatically
    sleuth.enable = true;

    # gc to comment visual regions / lines
    comment.enable = true;
  };
}
