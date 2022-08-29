#!/bin/bash

# Validação 1

(($# != 2)) && echo "Falhou validação 1" && exit

# Validação 2

pattern='^[0-9]+$'
! [[ $1 =~ $pattern ]] && echo "Falhou validação 2" && exit

# Validação 3

(($1 > 10)) && echo "Falhou validação 3" && exit

trap "echo Ai! Recebi um sinal!;echo" SIGINT SIGTERM
trap -p

while true; do
    echo "$(date +%T): Escrevi a frase: $2"
    sleep $1
done