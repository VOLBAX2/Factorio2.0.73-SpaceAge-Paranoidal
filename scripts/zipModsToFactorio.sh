#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
read -p "Enter path to Factorio game data:" dataPath

read -p "Zipped mods will be stored at $dataPath/mods. Continue?(Ctrl-C to cancel):"
mkdir -p "$dataPath/mods"

packFolder() {
	folder="$1"
	ls $folder | while read mod; do
		if [[ -f "$folder/$mod/info.json" ]]; then
			local version="$(cat "$folder/$mod/info.json" | jq '.version')"
			local modName="$(cat "$folder/$mod/info.json" | jq '.name')"
			echo "Found mod $mod. Packing to ${modName:1:-1}_${version:1:-1}..."
			(cd "$folder" && zip -r "$dataPath/mods/${modName:1:-1}_${version:1:-1}.zip" "$mod/")
		fi
	done
}

packFolder "$SCRIPT_DIR/../mods"
packFolder "$SCRIPT_DIR/../custom-mods"
