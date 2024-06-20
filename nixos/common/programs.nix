# programs.nix
{
  config,
  pkgs,
  ...
}: {
  programs = {
    firefox.enable = true;
    gamemode.enable = true;

    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
  };
}
