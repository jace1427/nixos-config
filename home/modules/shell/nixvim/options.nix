# options.nix
{ pkgs, ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    opts = {
      relativenumber = true;
      number = true;
      mouse = "";
      showmode = false;
      clipboard = "unnamedplus";
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
      conceallevel = 1;
      grepprg = "rg --vimgrep";
    };

    autoGroups = {
      highlight-on-yank = {
        clear = true;
      };
    };

    autoCmd = [
      {
        desc = "Highlight when yanking (copying) text";
        group = "highlight-on-yank";
        event = "TextYankPost";
        callback = {
          __raw = "function() vim.highlight.on_yank() end";
        };
      }

      # nvim file with cursor at last edit
      {
        desc = "Open file with cursor at last edit";
        event = "BufReadPost";
        callback = {
          __raw = "function() vim.api.nvim_exec('silent! normal! g`\"zc', false) end";
        };
      }
    ];
  };
}
