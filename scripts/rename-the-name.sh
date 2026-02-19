#!/usr/bin/env bash

# change everything like "<name>" to "<newname>"
#	 i use it to add prefix bob- or angels- to items

if [[ $# < 2 ]]; then
	echo "Usage $0 <name> <newname>"
	exit 0
fi

name="$1"
newname="$2"

rg "\"$name\"" --stats

echo ""
echo "$name will be renamed to $newname"
echo ""

read -p "continue(ctrl-c to abort)?"

rg "\"$name\"" | cut -d':' -f 1 | uniq | xargs sed -i "s/\"$name\"/\"$newname\"/g"
