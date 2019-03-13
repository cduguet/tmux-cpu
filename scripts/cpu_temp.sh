#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_cpu_temp() {
	if command_exists "sensors"; then

		sensors | sed '/^[^Package]/d' | sed '/^\s*$/d' | tail -n 1 | awk '{a=$4} END {printf("%5.0fºC", a)}'

	else
		echo "no sensors found"
	fi
}

main() {
	print_cpu_temp
}
main
