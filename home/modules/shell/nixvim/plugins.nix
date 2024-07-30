# default.nix
{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-vim
    vim-markdown
    vim-nix
  ];

  programs.nixvim.plugins = {
    # Latex on vim
    vimtex.enable = true;

    # better quickfix
    nvim-bqf.enable = true;

    # better $/progress
    fidget.enable = true;

    # detect tabstop automatically
    sleuth.enable = true;

    # gc to comment visual regions / lines
    comment.enable = true;

    # indentation guides even on blank lines
    indent-blankline.enable = true;

    # nix syntax highlighting
    nix.enable = true;

    # bufferline
    bufferline.enable = true;

    # automatically add closing / opening braces
    nvim-autopairs.enable = true;

    # completion
    cmp-rg.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-latex-symbols.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm { select = true }";
        };

        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };

    conform-nvim = {
      enable = true;
      notifyOnError = true;
      formatOnSave = "function(args) require('conform').format({ bufnr = args.buf }) end";
      formattersByFt = {
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [
          "isort"
          "black"
        ];
        rust = [ "rustfmt" ];
        "*" = [ "codespell" ];
        markdown = [ "markdownlint-cli2" ];
      };
    };

    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {
            text = "+";
          };
          change = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
        };
      };
    };

    lint = {
      enable = true;

      lintersByFt = {
        text = [ "vale" ];
        markdown = [ "markdownlint-cli2" ];
      };

      autoCmd.event = [
        "BufEnter"
        "BufWritePost"
        "InsertLeave"
      ];
    };

    neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      openFilesInLastWindow = true;
      filesystem = {

        filteredItems = {
          hideDotfiles = false;
          hideGitignored = false;
          visible = true;
        };
      };
    };

    obsidian = {
      enable = true;
      settings.workspaces = [
        {
          name = "vault";
          path = "~/dir/vault";
        }
      ];
    };

    telescope.enable = true;

    treesitter.enable = true;

    which-key.enable = true;
  };
}
