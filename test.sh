#!/usr/bin/env bash
cd /home/jspidell/dir/nixos-config
nixfmt . &>fmt.log
if !(cat fmt.log | grep -A 5 "Failed!"); then
    git diff -U0
    git add * &>/dev/null
    echo -e "\nNixOs Rebuilding..."
    sudo nixos-rebuild test --flake .#nixos --show-trace &>switch.log
    if !(cat switch.log | grep --color error); then
        echo -e "\nBuild successful!\n"
    fi
fi