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
      re = "~/dir/nixos-config/rebuild.sh";
      nfu = "sudo nix flake update";
      uv = "~/dir/vault/update_vault.sh";
      wow = "flatpak run --command=bottles-cli com.usebottles.bottles run -b Battle.net -p Battle.net &> /dev/null";
      r = "$(fc -ln -1)";
      dr = "dotnet run";
      v = "nvim .";
      vn = "cd ~/dir/nixos-config/; nvim .";
      cl = "cd $@; ls";
      nsp = "nix-shell -p $@";

      # cd's
      ".." = "cd ..";
      "..." = "cd ../..";
      dir = "cd ~/dir/";
      nixos = "cd ~/dir/nixos-config";
      tools = "cd ~/dir/tools/";
      vault = "cd ~/dir/vault/";
      repos = "cd ~/dir/repos/";
    };
  };
}
