# keymaps.nix
{ pkgs, ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>nohlsearch<CR>";
        key = "<Esc>";
        mode = "n";
      }

      # Diagnostic keymaps
      {
        action = "vim.diagnostic.goto_prev";
        key = "[d";
        mode = "n";
        options.desc = "Go to previous [D]iagnostic message";
      }
      {
        action = "vim.diagnostic.goto_next";
        key = "]d";
        mode = "n";
        options.desc = "Go to next [D]iagnostic message";
      }
      {
        action = "vim.diagnostic.open_float";
        key = "<leader>e";
        mode = "n";
        options.desc = "Show diagnostic [E]rror messages";
      }
      {
        action = "vim.diagnostic.setloclist";
        key = "<leader>q";
        mode = "n";
        options.desc = "Open diagnostic [Q]uickfix list";
      }

      # plugin keymaps (some plugin keymaps are in their plugin files)
      {
        action = "function() require('conform').format { async = true, lsp_fallback = true } end";
        key = "<leader>f";
        mode = "";
        options.desc = "[F]ormat buffer";
      }

      # buffers
      {
        action = ":bufffers<CR>";
        key = "<leader>b";
        mode = "";
        options.desc = "Open [B]uffer list";
      }
      {
        action = ":bnext<CR>";
        key = "<C-l>";
        mode = "";
        options.desc = "Go to next Buffer";
      }
      {
        action = ":bprev<CR>";
        key = "<C-h>";
        mode = "";
        options.desc = "Go to previous Buffer";
      }
      {
        action = ":bquit<CR>";
        key = "<C-q>";
        mode = "";
        options.desc = "[Q]uit Buffer";
      }
    ];
  };
}
