# waybar.nix
{
  pkgs,
  config,
  lib,
  ...
}:
let
  commonDeps = with pkgs; [
    coreutils
    gnugrep
    systemd
  ];
  # Function to simplify making waybar outputs
  mkScript =
    {
      name ? "script",
      deps ? [ ],
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
  mkScriptJson =
    {
      name ? "script",
      deps ? [ ],
      pre ? "",
      text ? "",
      tooltip ? "",
      alt ? "",
      class ? "",
      percentage ? "",
    }:
    mkScript {
      deps = [ pkgs.jq ] ++ deps;
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
in
{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        passthrough = false;
        position = "top";
        height = 30;
        exclusive = true;

        output = [
          "DP-1"
          "DP-2"
          "DP-3"
          "HDMI-A-1"
        ];

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [
          "cpu"
          "custom/gpu"
          "memory"
          "temperature"
        ];

        modules-right = [
          "pulseaudio"
          "network"
          "clock"
        ];

        clock = {
          interval = 1;
          format = "{:%a %m/%d %I:%M}";
          tooltip-format = ''
            <big>{:%B %Y}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        cpu = {
          format = "  {usage}%";
        };

        "custom/gpu" = {
          interval = 5;
          exec = mkScript { script = "cat /sys/class/drm/card1/device/gpu_busy_percent"; };
          format = "󰒋  {}%";
        };

        memory = {
          format = "  {}%";
          interval = 5;
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
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

        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "hyprland/window" = {
          "max-length" = 200;
          "separate-outputs" = true;
        };

        "custom/currentplayer" = {
          interval = 2;
          return-type = "json";
          exec = mkScriptJson {
            deps = [ pkgs.playerctl ];
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
            deps = [ pkgs.playerctl ];
            script = "playerctl status 2>/dev/null";
          };
          exec =
            let
              format = ''{"text": "{{title}} - {{artist}}", "alt": "{{status}}", "tooltip": "{{title}} - {{artist}} ({{album}})"}'';
            in
            mkScript {
              deps = [ pkgs.playerctl ];
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
            deps = [ pkgs.playerctl ];
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
          padding: 1;
          margin: 0 0.4em;
          font-family: Terminus;
        }

        window#waybar {
          border-bottom: 3px solid;
        }

        button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
        }

        button:hover {
          background: inherit;
        }

        #workspaces button {
          padding: 0 5px;
          background-color: transparent;
        }

        #clock,
        #cpu,
        #custom-gpu,
        #memory,
        #temperature,
        #network,
        #pulseaudio,
        #tray,
        #custom-currentplayer
        {
          padding: 0 10px;
        }

        #window,
        #workspaces {
          margin: 0 4px;
        }
      '';
  };
}
