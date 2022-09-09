#!/usr/bin/env bash

# file-writer.sh: Write content to a prexisting file

# Usage: file-writer.sh <file-name> <file-content>

# Tests for an argument.
(($# != 2)) && echo "Falta argumento." && exit 1

# Tests for file existence.
test ! -e "$1" && echo "Ficheiro nao existe." && exit 2

# Writes content to the file.
echo "$2" > "$1" && echo "Escrevi a frase: \"$2\" em $(date +%T)" && exit 0