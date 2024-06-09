{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = rec {
      gs = "git status";
      ga = "git add *";
      gp = "git push";
      cdir = "cd ~/dir/";
      cdnix = "cd ~/dir/nixos-config";
      t = "cd ~/dir/tools/";
      re = "~/dir/nixos-config/rebuild.sh";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
