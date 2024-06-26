# default.nix
{ pkgs, ... }:
{
  imports = [
    ./autopairs.nix
    ./cmp.nix
    ./conform.nix
    ./gitsigns.nix
    ./indent_line.nix
    ./link.nix
    ./lspconfig.nix
    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
  ];
}
