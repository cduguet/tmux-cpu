#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_gpu_temp() {
	if command_exists "nvidia-smi"; then
		loads=$(nvidia-smi | sed -nr 's/.*\s([0-9]+)C.*/\1/p')
		gpus=$(echo "$loads" | wc -l)
		load=$(echo "$loads" | awk '{count+=$1} END {print count}')
		echo "$load" | awk '{printf "%3.0fºC", $1}'
	else
		echo "nvidia-smi not found"
	fi
}

main() {
	print_gpu_temp
}
main
