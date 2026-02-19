#!/usr/bin/env bash

#
# fetch all prototype props
# inherited props included
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
apiFile="$SCRIPT_DIR/../factorio-apis/new/prototype-api.json"

while getopts ':vh' flag; do
	case "$flag" in
		v)
			apiFile="$SCRIPT_DIR/../factorio-apis/old/prototype-api.json"
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

printFormatted() {
	local res=$(cat <<EOF
name optional type 
$(echo "$1"  | sed -r 's/"name"/;/'| sed 's/"optional"/;/' | sed 's/"type"/;/' | sed -r 's/"|\}|\{//g' | awk -F';' '{print $2, $4, $3}' )
EOF
	)
	echo "${res::-1}" | column -t
}

proto=$($SCRIPT_DIR/get-proto.sh $1)
name=$(echo "$proto" | jq '. | .name' | sed 's/"//g')
if [[ ! "$name" ]]; then
	echo "prototype not found!"
	exit 0
fi
parent=$(echo "$proto" | jq '. | .parent' | sed 's/"//g')
props=$(echo "$proto" | jq -c '.properties[] | {name: .name, type: .type, optional: .optional}')

echo "Properties of type: $name:"
echo ""
printFormatted "$props" 
echo ""

while [[ "$parent" != "null" ]]; do
	proto=$($SCRIPT_DIR/get-proto.sh $parent)
	name=$(echo "$proto" | jq '. | .name' | sed 's/"//g')
	parent=$(echo "$proto" | jq '. | .parent' | sed 's/"//g')
	props=$(echo "$proto" | jq -c '.properties[] | {name: .name, type: .type, optional: .optional}')
	echo "Properties inherited from: $name:"
	echo ""
	printFormatted "$props"
	echo ""
done
