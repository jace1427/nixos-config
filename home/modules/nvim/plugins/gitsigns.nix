# gitsigns.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup{
                  signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                  },
                }
      '';
    }
  ];
}
