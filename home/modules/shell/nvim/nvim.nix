{
  config,
  pkgs,
  ...
}: let
  reloadNvim = ''
    XDG_RUNTIME_DIR=''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
    for server in $XDG_RUNTIME_DIR/nvim.*; do
      nvim --server $server --remote-send '<Esc>:source $MYVIMRC<CR>' &
    done
  '';
in {
  imports = [
    ./lsp.nix
    ./syntaxes.nix
    ./ui.nix
  ];
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;

    extraConfig =
      /*
      vim
      */
      ''
        "Use system clipboard
        set clipboard=unnamedplus

        "Lets us easily trigger completion from binds
        set wildcharm=<tab>

        set smartcase

        "Set fold level to highest in file
        "so everything starts out unfolded at just the right level
        augroup initial_fold
          autocmd!
          autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
        augroup END

        "Tabs
        set tabstop=4 "4 char-wide tab
        set expandtab "Use spaces
        set softtabstop=0 "Use same length as 'tabstop'
        set shiftwidth=0 "Use same length as 'tabstop'
        "2 char-wide overrides
        augroup two_space_tab
          autocmd!
          autocmd FileType json,html,htmldjango,hamlet,nix,scss,typescript,php,haskell,terraform setlocal tabstop=2
        augroup END

        "Set tera to use htmldjango syntax
        augroup tera_htmldjango
          autocmd!
          autocmd BufRead,BufNewFile *.tera setfiletype htmldjango
        augroup END

        "Fix nvim size according to terminal
        "(https://github.com/neovim/neovim/issues/11330)
        augroup fix_size
          autocmd VimEnter * silent exec "!kill -s SIGWINCH" getpid()
        augroup END

        "Line numbers
        set number relativenumber

        "Scroll up and down
        nmap <C-j> <C-e>
        nmap <C-k> <C-y>
      '';

    extraLuaConfig =
      /*
      lua
      */
      ''
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
        vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { desc = "Format code" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, { desc = "Code action" })

        -- Diagnostic
        vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { desc = "Diagnostics on loclist" })
        vim.keymap.set("n", "gq", vim.diagnostic.setqflist, { desc = "Diagnostics on quickfix" })

        function add_sign(name, text)
          vim.fn.sign_define(name, { text = text, texthl = name, numhl = name})
        end

        add_sign("DiagnosticSignError", "󰅚 ")
        add_sign("DiagnosticSignWarn", " ")
        add_sign("DiagnosticSignHint", "󰌶 ")
        add_sign("DiagnosticSignInfo", " ")
      '';

    plugins = with pkgs.vimPlugins; [
      vim-table-mode
      editorconfig-nvim
      vim-surround
      {
        plugin = nvim-autopairs;
        type = "lua";
        config =
          /*
          lua
          */
          ''
            require('nvim-autopairs').setup{}
          '';
      }
    ];
  };

  xdg.configFile."nvim/init.lua".onChange = reloadNvim;

  xdg.desktopEntries = {
    nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      comment = "Edit text files";
      exec = "nvim %F";
      icon = "nvim";
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      terminal = true;
      type = "Application";
      categories = [
        "Utility"
        "TextEditor"
      ];
    };
  };
}
