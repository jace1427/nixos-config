{pkgs, ...}: {
  programs.stylix = {
    targets.firefox = {
      enable = true;
      profileNames = ["Default"];
    };
  };
}
