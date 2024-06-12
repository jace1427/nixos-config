#!/usr/bin/env bash
cd /home/jspidell/dir/nixos-config
alejandra . &>/dev/null
git diff -U0 .
git add *
echo "NixOs Rebuilding..."
sudo nixos-rebuild switch --flake .#nixos --show-trace &>nixos-switch.log
home-manager switch --flake .#jspidell@nixos &>home-manager-switch.log
if !((cat nixos-switch.log | grep --color error) && (cat nixos-switch.log | grep --color error))
then
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
git push
fi
