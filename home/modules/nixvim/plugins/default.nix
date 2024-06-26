# default.nix
{ pkgs, ... }:
{
  imports = [

  ];
  programs.nixvim.plugins = {
    # detect tabstop automatically
    sleuth.enable = true;

    # gc to comment visual regions / lines
    comment.enable = true;
  };
}
