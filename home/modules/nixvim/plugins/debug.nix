# debug.nix
{ pkgs, ... }:
{
  programs.neovim.plugins.dap = {
    enable = true;
  };
}
