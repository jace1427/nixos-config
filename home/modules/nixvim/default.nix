# default.nix
{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    viAlias = true;
    vimAlias = true;
  };

  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins.nix
  ];
}
