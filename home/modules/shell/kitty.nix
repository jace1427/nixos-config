# kitty.nix
{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
    };
  };
}
