# default.nix
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins/default.nix
  ];
}
