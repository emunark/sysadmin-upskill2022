#!/usr/bin/env bash

# file-reader.sh: read a file line by line

(($# != 1)) && echo "Falta argumento." && exit 1 # tests for an argument
test ! -e "$1" && echo "Ficheiro nao existe." && exit 2 # tests for file existence

n_linha=1 # variable for line counter

while read linha; do
    echo "Li em $(date +%T) a linha $n_linha: $linha"
    ((n_linha++)) # increments the line counter
done < "$1" # reads the file in argument