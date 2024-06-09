{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAbbrs = rec {
      gs = "git status";
    };
  };
}
