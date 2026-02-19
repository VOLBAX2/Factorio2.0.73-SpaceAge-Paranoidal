#!/usr/bin/env bash
# "<name>" -> "<prefix><name>"

if [[ $# < 2 ]]; then
	echo "Usage: $0 <prefix> <name>"
fi

prefix="$1"
name="$2"

rg "\"$name\"" --stats

echo ""
echo "$name will be renamed to ${prefix}${name}"
echo ""

read -p "continue(ctrl-c to abort)?"
rg "\"$name\"" | cut -d':' -f 1 | uniq | xargs sed -i "s/\"$name\"/\"${prefix}${name}\"/g"
