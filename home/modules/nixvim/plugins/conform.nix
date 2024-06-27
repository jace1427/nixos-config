# conform.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    formatOnSave = "function(bufnr) return { timeout_ms = 500 } end";
    formattersByFt = {
      lua = [ "stylua" ];
      nix = [ "nixfmt" ];
    };
  };
}
