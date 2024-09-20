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
in
{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        layer = "bottom";
        position = "bottom";
        mode = "dock";
        exclusive = true;
        margin-bottom = -1;
        passthrough = false;
        height = 41;

        output = [
          "DP-1"
          "DP-2"
          "DP-3"
          "HDMI-A-1"
        ];

        modules-left = [
          "custom/os_button"
          "hyprland/workspaces"
          "wlr/taskbar"
        ];

        modules-center = [ ];

        modules-right = [
          "cpu"
          "custom/gpu"
          "memory"
          "disk"
          "temperature"
          "pulseaudio"
          "clock"
        ];

        disk = {
          interval = 30;
          format = "󰋊 {percentage_used}%";
          path = "/";
          tooltip = true;
          unit = "GB";
          tooltip-format = "Available {free} of {total}";
        };

        clock = {
          interval = 1;
          format = "{:%I:%M %p %A %m/%d/%Y}";
          tooltip-format = ''
            <tt><small>{calendar}</small></tt>
          '';
          calendar = {
            mode = "year";
            mode-mon-col = 3;
          };
        };

        cpu = {
          interval = 5;
          format = "  {usage}%";
          max-length = 10;
        };

        "custom/gpu" = {
          interval = 5;
          exec = mkScript { script = "cat /sys/class/drm/card1/device/gpu_busy_percent"; };
          format = "󰒋  {}%";
        };

        memory = {
          interval = 10;
          format = "  {percentage}%";
          max-length = 10;
          tooltip = true;
          tooltip-format = "RAM - {used:0.1f}GiB used";
        };

        "wlr/taskbar" = {
          format = "{icon} {name:.20}";
          icon-size = 28;
          spacing = 3;
          on-click-middle = "close";
          tooltip-format = "{title}";
          on-click = "activate";
        };

        temperature = {
          critical-threshold = 80;
          format = "({temperatureC}°C)";
          format-critical = "({temperatureC}°C)";
          tooltip = false;
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

        "hyprland/window" = {
          "max-length" = 200;
          "separate-outputs" = true;
        };

        "hyprland/workspaces" = {
          "icon-size" = 32;
          "spacing" = 15;
          "on-scroll-up" = "hyprctl dispatch workspace r+1";
          "on-scroll-down" = "hyprctl dispatch workspace r-1";
        };

        "custom/os_button" = {
          "format" = "";
          "on-click" = "wofi --show drun";
          "tooltip" = false;
        };

        style =
          # css
          ''
            * {
              font-family: Terminus;
              text-shadow: none;
              box-shadow: none;
              border: none;
              border-radius: 0;
              font-weight: 600;
              font-size: 12.7px;
            }

            window#waybar {
              border-top: 1px solid @border_main;
            }

            tooltip {
              border-radius: 5px;
              border-width: 1px;
              border-style: solid;
            }

            #custom-os_button {
              fontsize: 24px;
              padding-left: 12px;
              padding-right: 20px;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            #workspaces {
              margin-r8ight: 1.5px;
              margin-left: 1.5px;
            }

            #workspaces button {
              padding: 3px;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            #workspaces button.active {
              border-bottom: 3px solid white;
            }

            #workspaces button.urgent {
              border-bottom: 3px dashed solid red;
            }

            #taskbar {
            }

            #taskbar button {
              min-width: 130px;
              border-bottom: 3px solid rgba(255, 255, 255, 0.3);
              margin-left: 2px;
              margin-right: 2px;
              padding-left: 8px;
              padding-right: 8px;
              color: white;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            #taskbar button.active {
              border-bottom: 3px solid white;
            }

            #taskbar button:hover {
              border-bottom: 3px solid white;
            }

            #cpu, #disk, #memory {
              padding:3px;
            }

            #temperature {
              font-size: 0px;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            #temperature.critical {
              padding-right: 3px;
              font-size: initial;
              border-bottom: 3px dashed;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            #window {
              border-radius: 10px;
              margin-left: 20px;
              margin-right: 20px;
            }

            #pulseaudio {
              font-family: "Terminus";
              padding-left: 3px;
              padding-right: 3px;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            #network {
              padding-left: 3px;
              padding-right: 3px;
            }

            #clock {
              padding-right: 5px;
              padding-left: 5px;
              transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
            }
          '';
      };
    };
  };
}
