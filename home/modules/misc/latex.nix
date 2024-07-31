{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-medium supertabular; });
in
{
  home.packages = with pkgs; [ tex ];
}
