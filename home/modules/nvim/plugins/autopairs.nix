# autopairs.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-autopairs;
      type = "lua";
      config = ''
        require('nvim-autopairs').setup{}
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        local cmp = require 'cmp'
        cmp.event:on('confim_done', cmp_autopairs.onconfirm_done())
      '';
    }
  ];
}
