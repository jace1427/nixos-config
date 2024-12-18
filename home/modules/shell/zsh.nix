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

    initExtra = ''
      function chpwd() {
        emulate -L zsh
        ls --color=auto -1FA -I.git
      }
    '';

    shellAliases = rec {
      # git
      gs = "git status";
      ga = "git add *";
      gc = "git commit -m $1";
      gp = "git push";
      gpu = "git pull";
      gd = "git diff";
      gco = "git checkout $1";
      gbd = "git branch -D $1";

      # aliases
      ls = "ls --color=auto -1FA -I.git";
      re = "./rebuild.sh";
      te = "/home/jspidell/dir/nixos-config/test.sh";
      nfu = "sudo nix flake update";
      uv = "~/dir/vault/update_vault.sh";
      wow = "flatpak run --command=bottles-cli com.usebottles.bottles run -b Battle.net -p Battle.net &> /dev/null";
      killwow = "flatpak kill com.usebottles.bottles";
      r = "$(fc -ln -1)";
      v = "code .";
      nsp = "nix-shell -p $@ --command 'zsh'";
      wl = "appimage-run ~/dir/misc/warcraftlogs-v8.13.18.AppImage";

      # cd's
      ".." = "cd ..";
      "..." = "cd ../..";
      dir = "cd ~/dir/";
      nixos = "cd ~/dir/nixos-config";
      tools = "cd ~/dir/tools/";
      vault = "cd ~/dir/vault/";
      repos = "cd ~/dir/repos/";
      misc = "cd ~/dir/misc/";
    };
  };
}
