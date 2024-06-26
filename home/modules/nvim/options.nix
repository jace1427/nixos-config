{pkgs, ...}: {
  programs.neovim = {
    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.showmode = false
      vim.opt.clipboard = 'unnamedplus'
      vim.opt.breakindent = true
      vim.opt.undofile = true
      vim.opt.ignorecase = true
      vim.opt.smartcase = true
      vim.opt.signcolumn = 'yes'
      vim.opt.updatetime = 250
      vim.opt.timeoutlen = 300
      vim.opt.splitright = true
      vim.opt.splitbelow = true
      vim.opt.list = true
      vim.opt.listchars = { tab = '>> ', trail = '*', nbsp = '_>' }
      vim.opt.inccommand = 'split'
      vim.opt.cursorline = true
      vim.opt.scrolloff = 10
    '';
  };
}
