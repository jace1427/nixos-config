# lint.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      text = [ "vale" ];
      nix = [ "nix-linter" ];
      markdown = [ "markdownlint-cli2" ];
    };
    autoCmd.event = [
      "BufEnter"
      "BufWritePost"
      "InsertLeave"
    ];
  };
}
