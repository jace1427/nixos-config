# neo-tree.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nui-nvim
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        cmd = 'Neotree',
        keys = {
          { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
        },
        opts = {
          filesystem = {
            window = {
              mappings = {
                ['\\'] = 'close_window',
              },
            },
          },
        },
      '';
    }
  ];
}
