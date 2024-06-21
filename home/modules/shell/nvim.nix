# nvim.nix
{
  pkgs,
  config,
  ...
}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp
      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      comment-nvim
      vim-nix
      neodev-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      lualine-nvim
      nvim-web-devicons
      telescope-fzf-native-nvim
      nvim-cmp

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/lsp.lua;
      }

      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/telescope.lua;
      }

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]);
        config = toLuaFile ./nvim/treesitter.lua;
      }
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';
  };
}
