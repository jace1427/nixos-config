#!/bin/sh
cd /home/jspidell/dir/nixos-config
pushd .
alejandra . &>/dev/null
git diff -U0 .
echo "NixOs Rebuilding..."
sudo nixos-rebuild switch --flake .#nixos &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
gen=&(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd