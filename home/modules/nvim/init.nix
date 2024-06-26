# init.nix
{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '
      vim.g.have_nerd_font = true

      require 'options'
      require 'keymaps'
      require 'lazy-bootstrap'
      require 'lazy-plugins'
    '';
  };

  imports = [
    ./options.nix
  ];
}
