#!/usr/bin/env bash

#
# Mod analysis, currectly contains fetching all require statements
#

if [[ $# < 2 ]]; then
	echo "Usage: $0 <path-to-mod> <command>"
	exit 0
fi

modPath="$1"
modName="$(echo "$modPath" | sed 's/\// /g' | awk '{print $NF}')"
action="$2"

AnalyseRequires() {
	local allRequires="$(rg '.*(require\("(.*)"\)).*' -r "\$2" $modPath | sort)"
	echo "$allRequires" | while read line; do
		local file="$(echo $line | cut -d ':' -f1)"
		local reqState="$(echo $line | cut -d ':' -f2-)"
		echo "$file -> $reqState"
	done
}


if [[ "$action" == "requires" ]]; then
	AnalyseRequires
fi
