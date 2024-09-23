# programs.nix
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    firefox.enable = true;
    gamemode.enable = true;
    neovim.enable = true;
    zsh.enable = true;
    tmux.enable = true;

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland = {
        enable = true;
      };
    };
  };
}
