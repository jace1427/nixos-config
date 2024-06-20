# bash.nix
{
  pkgs,
  config,
  ...
}: {
  programs.bash = {
    enable = true;
  };
}
