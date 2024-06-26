# default.nix
{ pkgs, ... }:
{
  imports = [
    # reverse order for some reason
    ./which-key.nix
    ./treesitter.nix
    ./telescope.nix
    ./neo-tree.nix
    ./lspconfig.nix
    ./link.nix
    ./indent_line.nix
    ./gitsigns.nix
    ./conform.nix
    ./cmp.nix
    ./autopairs.nix
  ];
}
