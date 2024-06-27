# treesitter.nix
{ pkgs, ...}: {
  programgs.nixvim.plugins.treesitter = {
    enable = true;
  };
};
