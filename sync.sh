#!/usr/bin/env bash

#
# sync custom-mods/* with $FACTORIO/mods/
#

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
printHelpMessage() {
	echo "Usage: $1 <path to game's files if env $FACTORIO not specified>"
}

if [[ $# < 1 && "$FACTORIO" == "" ]]; then
	printHelpMessage "$0"
	exit 0
fi

gameDir="$FACTORIO"
if [[ "$FACTORIO" == "" ]]; then
	gameDir="$1"
fi

rsync -r "$SCRIPT_DIR/custom-mods/" "$gameDir/mods/"
