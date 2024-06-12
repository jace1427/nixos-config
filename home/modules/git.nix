# git.nix
{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Justin Spidell";
    userEmail = "justintspidell@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      advice.addIgnoredFile = false;
      push.autoSetupRemote = true;
    };
  };
}
