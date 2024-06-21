# programs.nix
{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs = {
    firefox.enable = true;
    neovim.enable = true;

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland = {
        enable = true;
      };
    };
  };
}
