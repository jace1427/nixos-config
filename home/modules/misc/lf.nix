{ pkgs, config, ... }:
{
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    previewer = {
      keybinding = "p";
      source = /etc/profiles/per-user/jspidell/bin/pistol;
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    keybindings = {
      m = "mkdir";
      "<enter>" = "open";
      ee = "editor-open";
      do = "dragon-out";
    };

    commands = {
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
          ''${{
            printf "Directory Name: "
            read DIR
            mkdir $DIR
        }}
      '';
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
    };
  };
}
