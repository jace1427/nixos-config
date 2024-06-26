# neo-tree.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        version = '*',
        dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
          'MunifTanjim/nui.nvim',
        },
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
