{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    aliases = {
      p = "push";
    };
    userName = "Justin Spidell";
    userEmail = "justintspidell@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      advice.addIgnoredFile = false;
      push.autoSetupRemote = true;
    };
  };
}
