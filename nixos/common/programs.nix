# programs.nix
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  # enable the Hyprland Cachix before enabling hyprland
  # TODO consider moving out?
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs = {
    firefox.enable = true;
    gamemode.enable = true;
    neovim.enable = true;
    zsh.enable = true;
    tmux.enable = true;
    thunar.enable = true;

    hyprland = {
      enable = true;
      # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # portalPackage =
      #   inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland = {
        enable = true;
      };
    };
  };
}
