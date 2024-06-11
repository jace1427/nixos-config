{
  config,
  pkgs,
  ...
}: {
  programs = {
    firefox = {
      enable = true;
    };
    fish = {
      enable = true;
      vendor = {
        completions.enable = true;
        config.enable = true;
        functions.enable = true;
      };
    };
  };
}
