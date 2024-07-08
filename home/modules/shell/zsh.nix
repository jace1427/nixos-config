# zsh.nix
{ pkgs, config, ... }:
{
  programs.thefuck.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      ignoreDups = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "eastwood";
    };

    shellAliases = rec {
      # git
      gs = "git status";
      ga = "git add *";
      gc = "git commit -m $1";
      gp = "git push";
      gd = "git diff";
      gco = "git checkout $1";
      gbd = "git branch -D $1";

      # aliases
      ls = "ls --color=auto -1lFA -I.git";
      vnix = "nvim ~/dir/nixos-config";
      re = "~/dir/nixos-config/rebuild.sh";
      nfu = "n; sudo nix flake update";
      uv = "~/dir/vault/update_vault.sh";
      wow = "flatpak run --command=bottles-cli com.usebottles.bottles run -b Battle.net -p Battle.net";
      r = "$(fc -ln -1)";
      dr = "dotnet run";
      vi = "nvim .";

      # cd's
      ".." = "cd ..";
      "..." = "cd ../..";
      d = "cd ~/dir/";
      n = "cd ~/dir/nixos-config";
      t = "cd ~/dir/tools/";
      v = "cd ~/dir/vault/";
      repos = "cd ~/dir/repos/";
    };
  };
}
