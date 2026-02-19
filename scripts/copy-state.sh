#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
factorio="$FACTORIO"
if [[ ! "$factorio" ]]; then
	read -p "Input absolute path to factorio data(where mods/ stored): " factorio
fi

echo "$(find $factorio/mods/ -maxdepth 1 -type d)" | while IFS=  read -r D; do
	modname=$(echo "$D" | awk -F'/' '{print $NF}')
	mkdir -p "$SCRIPT_DIR/../mods-state/mods/$modname"
	cp "$D/info.json" "$SCRIPT_DIR/../mods-state/mods/$modname/"
	echo "Copied info of: $modname"
done

cp "$factorio/mods/mod-list.json" "$SCRIPT_DIR/../mods-state/"

