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
      nfu = "n; sudo nix flake update";

      # cd's
      ".." = "cd ..";
      "..." = "cd ../..";
      d = "cd ~/dir/";
      n = "cd ~/dir/nixos-config";
      t = "cd ~/dir/tools/";
      v = "cd ~/dir/vault/";
    };
    interactiveShellInit = ''
      set -g fish_key_bindings fish_default_key_bindings
      bind \cc kill-whole-line repaint
      bind \cd forward-char
    '';
  };
}
