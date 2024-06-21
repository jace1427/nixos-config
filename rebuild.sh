#!/usr/bin/env bash
nix='/home/jspidell/dir/nixos-config'
alejandra $nix > $nix/alejandra.log
if !(cat alejandra.log | grep Failed!)
then
	git diff -U0 $nix
	git add $nix/*
	echo "NixOs Rebuilding..."
	sudo nixos-rebuild switch --flake $nix#nixos --show-trace > $nix/nixos-switch.log
	if !(cat $nix/nixos-switch.log | grep --color error)
	then
		gen=$(nixos-rebuild list-generations | grep current)
		git commit -am "$gen"
		git push
	fi
fi

