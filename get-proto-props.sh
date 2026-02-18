#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

printHelpMessage() {
	echo "Usage: $1 [OPTIONS] <proto-name>"
	echo "option: -v [use old factorio api]"
	echo "option: -h [print this help message and exit]"
	echo "--------- PROP DATA FETCHING ---------"
	echo "if used one of flags below the output contains only selected fields"
	echo "option: -n [print prop names only]"
	echo "option: -d [print prop description only]"
}

if [[ $# < 1 ]]; then
	printHelpMessage "$0"
	exit 0
fi

names=""
desc=""
_type=""

apiFile="$SCRIPT_DIR/factorio-apis/prototype-api2.0.73.json"

while getopts ':vhndt' flag; do
	case "$flag" in
		v)
			apiFile="$SCRIPT_DIR/factorio-apis/prototype-api1.1.110.json"
			;;
		h)
			printHelpMessage "$0"
			exit 0
			;;
		n)
			names="true"
			;;
		d)
			desc="true"
			;;
		t)
			_type="true"
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

protoName="$1"

additional=""
if [[ "$names" ]]; then
	additional="$additional,.name"
fi

if [[ "$desc" ]]; then
	additional="$additional,.description"
fi
if [[ "$_type" ]]; then
	additional="$additional,.type"
fi

if [[ "$additional" ]]; then
	additional="| $(echo "$additional" | cut -c 2-)"
fi

cat "$apiFile" | jq ".prototypes[] | select(.typename == \"$protoName\") | .properties[] $additional"
