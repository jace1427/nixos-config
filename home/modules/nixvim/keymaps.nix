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
    ];
  };
}
