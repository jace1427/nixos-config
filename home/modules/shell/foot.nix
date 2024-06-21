# foot.nix
{
  pkgs,
  config,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      font-size-adjustment = "10px";
    };
  };
}
