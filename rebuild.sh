#!/usr/bin/env bash
cd /home/jspidell/dir/nixos-config
alejandra . &> alejandra.log
if !(cat alejandra.log | grep -A 5 "Failed!")
then
	git diff -U0 
	git add * &> /dev/null
	echo "\nNixOs Rebuilding..."
	sudo nixos-rebuild switch --flake .#nixos --show-trace &> switch.log
	if !(cat switch.log | grep --color error)
	then
        echo "\nBuild successful!"
		gen=$(nixos-rebuild list-generations | grep current)
		git commit -am "$gen"
		git push
	fi
fi

