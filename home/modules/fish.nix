# fish.nix
{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = rec {
      # git
      gs = "git status";
      ga = "git add *";
      gp = "git push";

      # aliases
      ls = "ls --color=auto -1FCA -I.git";
      vnix = "code ~/dir/nixos-config";
      re = "~/dir/nixos-config/rebuild.sh";
      nfu = "sudo nix flake update";

      # cd's
      ".." = "cd ..";
      "..." = "cd ../..";
      d = "cd ~/dir/";
      n = "cd ~/dir/nixos-config";
      t = "cd ~/dir/tools/";
      v = "cd ~/dir/vault/";
    };
  };
}
