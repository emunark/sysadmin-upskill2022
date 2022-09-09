#!/usr/bin/env bash

ran="$RANDOM"
total="$(( ran %= 500 ))"
i=1

while [ $i -lt 11 ]; do
    res=$(( total * i ))
    echo "$total x $i = $res"
    i=$(( i+1 ))
done