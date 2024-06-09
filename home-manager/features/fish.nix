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
      cddir = "cd ~/dir/";
      cdnix = "cd ~/dir/nixos-config";
      vnix = "code ~/dir/nixos-config";
      t = "cd ~/dir/tools/";
      re = "~/dir/nixos-config/rebuild.sh";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
