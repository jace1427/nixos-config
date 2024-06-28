# default.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    # detect tabstop automatically
    sleuth.enable = true;

    # gc to comment visual regions / lines
    comment.enable = true;

    # indentation guides even on blank lines
    # TODO broken?
    # indent_blankline.enable = true;

    # nix syntax highlighting
    nix.enable = true;

    # bufferline
    bufferline.enable = true;

    # automatically add closing / opening braces
    nvim-autopairs.enable = true;

    # completion
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-y>" = "cmp.mapping.confirm { select = true }";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-l>" = "cmp.mapping(function() if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end end, { 'i', 's' })";
          "<C-h>" = "cmp.mapping(function() if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end end, { 'i', 's' })";
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
      formatOnSave = "";
      formattersByFt = {
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
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
        nix = [ "nixfmt" ];
        markdown = [ "markdownlint-cli2" ];
      };

      autoCmd.event = [
        "BufEnter"
        "BufWritePost"
        "InsertLeave"
      ];

      linters = {
        nixfmt = {
          cmd = "nixfmt";
        };
      };
    };

    neo-tree.enable = true;

    obsidian.enable = true;

    telescope.enable = true;

    treesitter.enable = true;

    which-key.enable = true;
  };
}
