#!/usr/bin/env bash
nixdir = /home/jspidell/dir/nixos-config
if !(ashlejandra $nixdir | grep Failed!)
then
	git diff -U0 $nixdir
	git add $nixdir/*
	echo "NixOs Rebuilding..."
	sudo nixos-rebuild switch --flake $nixdir#nixos --show-trace &>$nixdir/nixos-switch.log
	if !(cat $nixdir/nixos-switch.log | grep --color error)
	then
		gen=$(nixos-rebuild list-generations | grep current)
		git commit -am "$gen"
		git push
	fi
fi

