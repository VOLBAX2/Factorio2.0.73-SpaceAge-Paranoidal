#!/usr/bin/env bash

# Get full proto information
#

printHelpMessage() {
	echo "Usage: $1 [OPTIONS] <proto-name>"
	echo "option: -v [use old factorio api]"
	echo "option: -h [print this help message and exit]"
}

if [[ $# < 1 ]]; then
	printHelpMessage "$0"
	exit 0
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
apiFile="$SCRIPT_DIR/factorio-apis/prototype-api2.0.73.json"

while getopts ':vh' flag; do
	case "$flag" in
		v)
			apiFile="$SCRIPT_DIR/factorio-apis/prototype-api1.1.110.json"
			;;
		h)
			printHelpMessage "$0"
			exit 0
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument" >&2
			exit 1
			;;
	esac
done

shift $((OPTIND - 1))

rg "\"name\":\s\"$1\"" "$apiFile" -B 1 -A 30000 | jq '.' 2>/dev/null
