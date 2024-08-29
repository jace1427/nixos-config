{ pkgs, config, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      esbenp.prettier-vscode
      bbenoist.nix
      streetsidesoftware.code-spell-checker
      davidanson.vscode-markdownlint
      svelte.svelte-vscode
      brettm12345.nixfmt-vscode
    ];
  };
}
