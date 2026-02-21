#!/usr/bin/env bash

# change everything like "<name>" to "<newname>"
#	 i use it to add prefix bob- or angels- to items

printHelpMessage() {
	echo "Usage: $1 [OPTIONS] <old-name> <new-name>"
	echo "option: -y [don't ask to continue]"
	echo "option: -h [print this help message and exit]"
}

if [[ $# < 2 ]]; then
	printHelpMessage "$0"
	exit 0
fi
dontAsk=""
while getopts ':yh' flag; do
	case "$flag" in
		y)
		dontAsk="true"
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

name="$1"
newname="$2"

rg "\"$name\"" --stats

echo ""
echo "$name will be renamed to $newname"
echo ""

if [[ "$dontAsk" != "true" ]]; then
	read -p "continue(ctrl-c to abort)?"
fi

rg "\"$name\"" | cut -d':' -f 1 | uniq | xargs sed -i "s/\"$name\"/\"$newname\"/g"
