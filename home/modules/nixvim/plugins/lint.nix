# lint.nix
{ pkgs, ... }:
{
  programs.nixvim.plugins.lint = {
    enable = true;

    lintersByFt = {
      text = [ "vale" ];
      # nix = [ "nixfmt" ];
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
}
