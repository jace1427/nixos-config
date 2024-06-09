{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    shellAbbrs = rec {
      gs = "git status";
    };
  };
}
