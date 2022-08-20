#!/usr/bin/env bash
echo "$BASH_VERSION"

if [[ -x "$1" ]]; then
    echo "$1 existe e é executável"
elif [ -f "$1" ]; then
    echo "$1 existe"
else
    echo "$1 não existe"
fi