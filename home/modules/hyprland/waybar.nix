# waybar.nix
{
  pkgs,
  config,
  lib,
  ...
}: let
  commonDeps = with pkgs; [
    coreutils
    gnugrep
    systemd
  ];
  # Function to simplify making waybar outputs
  mkScript = {
    name ? "script",
    deps ? [],
    script ? "",
  }:
    lib.meta.getExe (
      pkgs.writeShellApplication {
        inherit name;
        text = script;
        runtimeInputs = commonDeps ++ deps;
      }
    );
  # Specialized for JSON outputs
  mkScriptJson = {
    name ? "script",
    deps ? [],
    pre ? "",
    text ? "",
    tooltip ? "",
    alt ? "",
    class ? "",
    percentage ? "",
  }:
    mkScript {
      deps = [pkgs.jq] ++ deps;
      script = ''
        ${pre}
        jq -cn \
          --arg text "${text}" \
          --arg tooltip "${tooltip}" \
          --arg alt "${alt}" \
          --arg class "${class}" \
          --arg percentage "${percentage}" \
          '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
      '';
    };
in {
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        exculsive = false;
        passthrough = false;
        position = "top";
        height = 30;

        output = [
          "DP-1"
          "DP-2"
          "DP-3"
        ];

        modules-left = [
          "custom/currentplayer"
          "custom/player"
        ];

        modules-center = ["hyprland/window"];

        modules-right = [
          "cpu"
          "custom/gpu"
          "memory"
          "pulseaudio"
          "clock"
        ];

        clock = {
          interval = 1;
          format = "{:%a %m/%d %H:%M}";
          tooltip-format = ''
            <big>{:%B %Y}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        cpu = {
          format = "  {usage}%";
        };

        "custom/gpu" = {
          interval = 5;
          exec = mkScript {script = "cat /sys/class/drm/card0/device/gpu_busy_percent";};
          format = "󰒋  {}%";
        };

        memory = {
          format = "  {}%";
          interval = 5;
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "   0%";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳";
            deactivated = "󰒲";
          };
        };

        "hyprland/window" = {
          "max-length" = 200;
          "separate-outputs" = true;
        };

        "custom/currentplayer" = {
          interval = 2;
          return-type = "json";
          exec = mkScriptJson {
            deps = [pkgs.playerctl];
            pre = ''
              player="$(playerctl status -f "{{playerName}}" 2>/dev/null || echo "No player active" | cut -d '.' -f1)"
              count="$(playerctl -l 2>/dev/null | wc -l)"
              if ((count > 1)); then
                more=" +$((count - 1))"
              else
                more=""
              fi
            '';
            alt = "$player";
            tooltip = "$player ($count available)";
            text = "$more";
          };
          format = "{icon}{}";
          format-icons = {
            "No player active" = " ";
            "Celluloid" = "󰎁 ";
            "spotify" = "󰓇 ";
            "ncspot" = "󰓇 ";
            "qutebrowser" = "󰖟 ";
            "firefox" = " ";
            "discord" = " 󰙯 ";
            "sublimemusic" = " ";
            "kdeconnect" = "󰄡 ";
            "chromium" = " ";
          };
        };

        "custom/player" = {
          exec-if = mkScript {
            deps = [pkgs.playerctl];
            script = "playerctl status 2>/dev/null";
          };
          exec = let
            format = ''{"text": "{{title}} - {{artist}}", "alt": "{{status}}", "tooltip": "{{title}} - {{artist}} ({{album}})"}'';
          in
            mkScript {
              deps = [pkgs.playerctl];
              script = "playerctl metadata --format '${format}' 2>/dev/null";
            };
          return-type = "json";
          interval = 2;
          max-length = 30;
          format = "{icon} {}";
          format-icons = {
            "Playing" = "󰐊";
            "Paused" = "󰏤 ";
            "Stopped" = "󰓛";
          };
          on-click = mkScript {
            deps = [pkgs.playerctl];
            script = "playerctl play-pause";
          };
        };
      };
    };
    style =
      # css
      ''
        * {
          font-size: 12pt;
          padding: 0;
          margin: 0 0.4em;
        }

        window#waybar {
          padding: 0;
          border-radius: 0.5em;
        }

        .modules-left {
          margin-left: -0.65em;
        }

        .modules-right {
          margin-right: -0.65em;
        }

        #workspaces button {
          padding-left: 0.4em;
          padding-right: 0.4em;
          margin-top: 0.15em;
          margin-bottom: 0.15em;
        }

        #clock {
          padding-right: 1em;
          padding-left: 1em;
          border-radius: 0.5em;
        }

        #custom-currentplayer {
          padding-right: 0;
        }

        #custom-gpu, #cpu, #memory {
          margin-left: 0.05em;
          margin-right: 0.55em;
        }
      '';
  };
}
