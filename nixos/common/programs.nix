# programs.nix
{
  config,
  pkgs,
  ...
}: {
  programs = {
    firefox.enable = true;
    gamemode.enable = true;
    # programs.hyprland.enable = true;

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
