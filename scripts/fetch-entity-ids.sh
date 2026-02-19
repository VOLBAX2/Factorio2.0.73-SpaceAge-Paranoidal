#!/usr/bin/env bash

# finds strings between "" from letters, - or _.
# Useful for rough look at entities in mod

if [[ $# < 1 ]]; then
	echo "Usage: $0 <path-to-mod>"
	exit 0
fi

modPath="$1"

rg '.*("[a-zA-Z0-9-_]*").*' -r 'qads $1 qads' "$modPath" | sed 's/qads/\n/g' | rg '"([a-zA-Z0-9-_]*)"' -r '$1'
