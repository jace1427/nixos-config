# options.nix{ pkgs, ... }:
{
  programs.neovim = {
    extraConfig = ''
      set wildcharm=<tab>
      set smartcase
      set tabstop = 4
      set expandtab
      set softtabstop=0
      set shiftwidth=0

      nmap <space>b :buffers<CR>
      nmap <C-l> :bnext<CR>
      nmap <C-h> :bprev<CR>
      <C-q> :bdel<CR>  augroup two_space_tab
      <space>e :e %:h<tab><CR>
      <space>q :cwindow<CR>

      autocmd!
        autocmd FileType nix setlocal tabstop = 2
      augroup END
    '';

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '
      vim.g.have_nerd_font = true
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.showmode = false
      vim.opt.clipboard = 'unnamedplus'
      vim.opt.breakindent = true
      vim.opt.undofile = true
      vim.opt.ignorecase = true
      vim.opt.signcolumn = 'yes'
      vim.opt.updatetime = 250
      vim.opt.timeoutlen = 300
      vim.opt.splitright = true
      vim.opt.splitbelow = true
      vim.opt.list = true
      vim.opt.inccommand = 'split'
      vim.opt.cursorline = true
      vim.opt.scrolloff = 10
    '';
  };
}
