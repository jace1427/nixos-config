#!/usr/bin/env bash
id=$(hyprctl activeworkspace -j | jq '.id')

if [ $1 -eq 1 ]; then
    if [ $id -eq 1 ]; then
        hyprctl dispatch workspace 2
    elif [ $id -eq 2 ]; then
        hyprctl dispatch workspace 1
    else
        hyprctl dispatch focusmonitor DP-2
    fi
elif [ $1 -eq 2 ]; then
    if [ $id -eq 3 ]; then
        hyprctl dispatch workspace 4
    elif [ $id -eq 4 ]; then
        hyprctl dispatch workspace 3
    else
        hyprctl dispatch focusmonitor DP-3
    fi
else
    if [ $id -eq 5 ]; then
        hyprctl dispatch workspace 6
    elif [ $id -eq 6 ]; then
        hyprctl dispatch workspace 5
    else
        hyprctl dispatch focusmonitor DP-1
    fi
fi
