#!/usr/bin/env bash
# "<name>" -> "<prefix><name>"

printHelpMessage() {
	echo "Usage: $1 [OPTIONS] <prefix> <name>"
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

flags=""
if [[ "$dontAsk" == "true" ]]; then
	flags="$flags -y"
fi
prefix="$1"
name="$2"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
$SCRIPT_DIR/rename-the-name.sh $flags "${prefix}" "${prefix}${name}"
