# indent_line.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = ''
        main = 'ibl',
        opts = {},
      '';
    }
  ];
}
