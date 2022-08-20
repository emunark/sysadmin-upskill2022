#!/bin/bash

## Cria um while statement com 10 loops, que multiplica o número inserido pelo utilizador e lido pelo comando `read`, multiplicando o mesmo pelo valor de $i (que começa em 1 mas vai incrementando em 1 no final de cada loop) e guardando o resultado na variável $res.
## Depois, faz print de uma string que utiliza os valores de cada variável de forma a imprimir uma expressão matemática do género 2 x 1 = 2.

echo "Insira um número: "
read num
i=1

while [ $i -lt 11 ]; do
res=$(( num * i ))
echo "$num x $i = $res"
i=$(( $i+1 ))
done