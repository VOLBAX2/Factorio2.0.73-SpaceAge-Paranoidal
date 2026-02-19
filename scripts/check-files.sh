#!/usr/bin/env bash

#
# Find all *.png/*.ogg strings and check it's existence
# This script can't find generic names created by strings concatenation for example


if [[ $# < 1 ]]; then
	echo "Usage: $0 <base-folder> [<folder-where-search>...]"
	exit 0
fi


raw=$(rg -r '$1' '.*"([_a-zA-Z0-9\-/]+.(png|ogg))".*' "$1" | cut -d':' -f2- | uniq)

for file in $(echo "$raw"); do
	modName="$(echo "$file" | cut -d'/' -f1)"
	if [[ ! $modName =~ __.*__ ]]; then
		echo "Invalid folder mod name: $file, skipping"
		continue
	fi
	
	fullpath="${modName:2:-2}/$(echo "$file" | cut -d'/' -f2-)"

	found="false"
	for folder in "$@"; do
		if [[ -f "$folder/$fullpath" ]]; then
			found="true"
			break
		fi
	done

	if [[ "$found" == "false" ]]; then
		echo "$file not found!"
		for link in "$(rg "$file" "$1" | cut -d':' -f1 | uniq)"; do
			echo -e "\tlinked in: $link"
		done
	fi
done


