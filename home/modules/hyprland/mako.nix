{pkgs, ...}: {
  services.mako = {
    enable = true;
    defaultTimeout = 10000;
  };
}
