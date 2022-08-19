#!/bin/bash

## roulette.sh

read -p "Insira um número até 500: " num
randomnum="$(( RANDOM %= 500 ))" ## $RANDOM is an internal Bash function (not a constant) that returns a pseudorandom integer in the range 0 - 32767.
guesses=0

while [ "$num" != "$randomnum" ]; do

	if [[ "$num" =~ ^-?[0-9]+$ ]]; then # testa se o número é válido

		if ((num < randomnum)); then
			echo "Muito pequeno."
			read -p "Tente outra vez: " num
		elif ((num > randomnum)); then
			echo "Muito grande."
			read -p "Tente outra vez: " num
		fi

		guesses="$(( guesses + 1 ))"

	else
		echo "Não é um número válido." >&2
		exit 1
	fi
done

echo "Acertou! Número de tentativas: $guesses"

exit