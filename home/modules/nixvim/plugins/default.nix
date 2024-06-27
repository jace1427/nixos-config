# default.nix
{ pkgs, ... }:
{
  imports = [
    ./autopairs.nix
    ./cmp.nix
    ./conform.nix
    ./gitsigns.nix
    ./lint.nix
    ./neo-tree.nix
  ];
  programs.nixvim.plugins = {
    # detect tabstop automatically
    sleuth.enable = true;

    # gc to comment visual regions / lines
    comment.enable = true;

    # indentation guides even on blank lines
    # TODO broken?
    # indent_blankline.enable = true;

    # nix syntax highlighting
    nix.enable = true;
  };
}
