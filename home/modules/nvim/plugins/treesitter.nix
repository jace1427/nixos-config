# treesitter.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter;
      type = "lua";
      config = ''
        require('nvim-treesitter.install').prefer_git = true
        require('nvim-treesitter.configs').setup{
          ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
          },
          indent = { enable = true, disable = { 'ruby' } },
        },
      '';
    }
  ];
}
