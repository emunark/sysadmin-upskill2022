#!/usr/bin/env bash

(( $# != 1 )) && echo "Error: no arguments" && exit 1

[ ! -e "$1" ] && echo "Error: file doesn't exist" && exit 2

awk -v date="$(date +%T)" '{print "Read line " NR " in " date ": " $0}' "$1"