{pkgs, ...}: {
  stylix = {
    targets.firefox = {
      enable = true;
      profileNames = ["Default"];
    };
  };
}
