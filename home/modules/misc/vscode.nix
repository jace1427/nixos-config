{ pkgs, config, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;

    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      esbenp.prettier-vscode
      bbenoist.nix
      streetsidesoftware.code-spell-checker
      davidanson.vscode-markdownlint
      svelte.svelte-vscode
      brettm12345.nixfmt-vscode
    ];

    userSettings = {
      # "editor.fontFamily" = "'Terminus'";
      # "terminal.integrated.fontFamily" = "'Terminus'";
      "workbench.colorTheme" = "Solarized Dark";
      "workbench.sideBar.location" = "right";
      "editor.renderWhitespace" = "boundary";
      "editor.wordWrap" = "on";
      "editor.minimap.renderCharacters" = false;
      # "vim.handleKeys" = [ { <C-w> = false; } ];
      # "vim.handleKeys" = {
      # "<C-w>" = false;
      # };
    };
  };
}
