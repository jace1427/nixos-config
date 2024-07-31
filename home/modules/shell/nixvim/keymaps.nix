# keymaps.nix
{ pkgs, ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        action = "<leader>";
        key = "<Space>";
        mode = "n";
      }

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

      # QuickFix
      {
        action = ":cwindow<CR>";
        key = "<leader>q";
        mode = "";
        options.desc = "Open [Q]uickfix";
      }
      {
        action = ":cnext<CR>";
        key = "]q";
        mode = "";
        options.desc = "Next [Q]uickfix";
      }
      {
        action = ":cprev<CR>";
        key = "[q";
        mode = "";
        options.desc = "Previous [Q]uickfix";
      }

      # buffers
      {
        action = ":buffers<CR>";
        key = "<leader>b";
        mode = "";
        options.desc = "Open [B]buffer list";
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
        action = ":bdel<CR>";
        key = "<C-q>";
        mode = "";
        options.desc = "[Q]uit Buffer";
      }

      # Save
      {
        action = ":w<CR>";
        key = "<leader>w";
        mode = "";
        options.desc = "[W]rite";
      }
      # Quit
      {
        action = ":qa<CR>";
        key = "<leader>qq";
        mode = "";
        options.desc = "[Q]uit all";
      }
      {
        action = ":q<CR>";
        key = "<leader>q";
        mode = "";
        options.desc = "[Q]uit";
      }

      # Windows
      {
        action = "<C-W>h";
        key = "<leader>h";
        mode = "";
        options.desc = "Move focus left";
      }
      {
        action = "<C-W>j";
        key = "<leader>j";
        mode = "";
        options.desc = "Move focus down";
      }
      {
        action = "<C-W>k";
        key = "<leader>k";
        mode = "";
        options.desc = "Move focus up";
      }
      {
        action = "<C-W>l";
        key = "<leader>l";
        mode = "";
        options.desc = "Move focus right";
      }

      {
        action = ":!!<CR>";
        key = "<leader>r";
        mode = "";
        options.desc = "[R]etry last command";
      }
      {
        action = ":!";
        key = "<leader>c";
        mode = "";
        options.desc = "Open [C]ommand prompt";
      }

      # Telescope
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>f";
        mode = "n";
        options.desc = "[F]ind files";
      }
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>g";
        mode = "n";
        options.desc = "Live [G]rep";
      }

      # WhichKey
      {
        action = ":WhichKey<CR>";
        key = "?";
        mode = "n";
        options.desc = "Search WhichKey";
      }
    ];
  };
}
