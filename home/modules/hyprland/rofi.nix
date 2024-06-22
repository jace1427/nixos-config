{
  pkgs,
  config,
  ...
}: {
  programs.rofi = {
    enable = true;
    # theme = "material";
  };
}
