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
      gd = "git diff";

      # aliases
      ls = "ls --color=auto -1lFA -I.git";
      vnix = "code ~/dir/nixos-config";
      re = "~/dir/nixos-config/rebuild.sh";
      nfu = "n; sudo nix flake update";
      uv = "~/dir/vault/update_vault.sh";
      wow = "flatpak run --command=bottles-cli com.usebottles.bottles run -b Battle.net -p Battle.net";

      # cd's
      ".." = "cd ..";
      "..." = "cd ../..";
      d = "cd ~/dir/";
      n = "cd ~/dir/nixos-config";
      t = "cd ~/dir/tools/";
      v = "cd ~/dir/vault/";
      r = "cd ~/dir/repos/";
    };
  };
}
