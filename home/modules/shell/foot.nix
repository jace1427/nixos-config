# foot.nix
{
  pkgs,
  config,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font-size-adjustment = "10px";
      };
    };
  };
}
