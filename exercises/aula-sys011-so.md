# Exercicios Sistemas Operativos - Shell

### 15. Utilize o comando `tee` para criar o ficheiro **p1.sh**, na diretoria base, com o conteúdo:

> #!/bin/bash
>
>echo "consegui"
>date
>
>cal
>
>pwd
>
>echo "adeus"

	$ tee p1-sys011.sh ## o nome foi modificado para evitar conflitos com o script criado na aula anterior

- Depois de dar permissões de execução ao ficheiro, execute os comandos da seguinte sequência e explique os resultados obtidos:

		$ chmod +x p1-sys011.sh

	- **a) ./p1.sh**

			$ ./p1-sys011.sh
			consegui
			Fri Aug 19 11:37:00 AM WEST 2022
			August 2022
			Su Mo Tu We Th Fr Sa
			1  2  3  4  5  6
			7  8  9 10 11 12 13
			14 15 16 17 18 19 20
			21 22 23 24 25 26 27
			28 29 30 31

			/home/utilizador1/base
			adeus

	Executa o script e todos os comandos normalmente.

	- **b) p1.sh**

			$ p1-sys011.sh
			bash: p1-sys011.sh: command not found...

	A diretoria "base" não se encontra no PATH e portanto, sem definir o caminho do script, este não é encontrado pelo bash.

	- **c) PATH=$PATH:.**

	Adiciona a diretoria actual ao PATH.

	- **d) echo $PATH**

			$ echo $PATH
			/home/utilizador1/.local/bin:/home/utilizador1/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:.

	Faz print da variável $PATH. Esta inclui agora a pasta atual.

	- **e) p1.sh**

			$ p1-sys011.sh
			consegui
			Fri Aug 19 11:42:42 AM WEST 2022
			August 2022
			Su Mo Tu We Th Fr Sa
			1  2  3  4  5  6
			7  8  9 10 11 12 13
			14 15 16 17 18 19 20
			21 22 23 24 25 26 27
			28 29 30 31

			/home/utilizador1/base
			adeus

	Desta vez, o bash é capaz de encontrar e executar o script correctamente.

### 16. Utilize o comando `tee` para criar o script **verargs**, na diretoria base, com o conteúdo:

Experimente o script anterior das seguintes formas:

- **a) verargs alberto bruno carlos dalila e f g h i j k l**

		$ verargs alberto bruno carlos dalila e f g h i j k l
		Arg1: alberto
		Arg2: bruno
		Arg4: dalila
		Arg11: k
		eu sou o ./verargs e foram usados 12 argumentos

- **b) verargs 1 2 3 4 5 6 7 8 9 10 11 12**

		$ verargs 1 2 3 4 5 6 7 8 9 10 11 12
		Arg1: 1
		Arg2: 2
		Arg4: 4
		Arg11: 11
		eu sou o ./verargs e foram usados 12 argumentos

- **c) verargs \~**

		$ verargs ~
		Arg1: /home/utilizador1
		Arg2:
		Arg4:
		Arg11:
		eu sou o ./verargs e foram usados 1 argumentos

- **d) verargs \***

		$ verargs *
		Arg1: conteudo2.txt
		Arg2: conteudo3.txt
		Arg4: cores
		Arg11: path.txt
		eu sou o ./verargs e foram usados 14 argumentos

- **e) verargs eu sou o $USER**

		$ verargs eu sou o $USER
		Arg1: eu
		Arg2: sou
		Arg4: utilizador1
		Arg11:
		eu sou o ./verargs e foram usados 4 argumentos

- **f) verargs "eu sou o $USER"**

		$ verargs "eu sou o $USER"
		Arg1: eu sou o utilizador1
		Arg2:
		Arg4:
		Arg11:
		eu sou o ./verargs e foram usados 1 argumentos

- **g) verargs 'eu sou o $USER'**

		$ verargs 'eu sou o $USER'
		Arg1: eu sou o $USER
		Arg2:
		Arg4:
		Arg11:
		eu sou o ./verargs e foram usados 1 argumentos

- **h) verargs $NADA nao existe**

		$ verargs $NADA nao existe
		Arg1: nao
		Arg2: existe
		Arg4:
		Arg11:
		eu sou o ./verargs e foram usados 2 argumentos

- **i) verargs "$NADA" pode existir**

		$ verargs "$NADA" pode existir
		Arg1:
		Arg2: pode
		Arg4:
		Arg11:
		eu sou o ./verargs e foram usados 3 argumentos

### 17. Utilize o programa `nano` para criar o script: **nomes.sh**, na diretoria base, com o conteúdo:

```
#!/bin/bash
echo -n "diga o nome: "
read nome
if echo $nome >> nomes.txt ; then
	echo "o nome $nome foi guardado"
else
	echo "Problemas ao guardar $nome"
fi
```

Experimente o script anterior das seguintes formas:

- **a) execute o programa várias vezes e verifique o conteúdo do ficheiro *nomes.txt***

	Cada execução do script adiciona uma nova linha ao ficheiro nomes.txt com o nome inserido após o prompt.

- **b) retire as permissões de escrita ao ficheiro *nomes.txt*, execute novamente o script e comente o resultado obtido**

		$ chmod -r nomes.sh
		$ nomes.sh
		/bin/bash: ./nomes.sh: Permission denied

	Não é possível executar um script sem permissões de leitura.

### 18. Utilize o programa `vi` para criar o script: **verifica.sh**, na diretoria base, com o conteúdo:

```
#!/bin/bash
if [ -f $1 ]; then
	echo "$1 existe"
else
	echo "$1 não existe"
fi
```

- **a) Justifique qual é o resultado de execução dos seguintes comandos:**

1. `./verifica.sh maria`

		$ ./verifica.sh maria
		maria não existe

	O comando [ (alternativa ao comando `test`) está a testar pela presença de um ficheiro, que será definido no argumento 1. Neste caso, o ficheiro **maria** não existe.

2. `./verifica.sh verifica.sh`

		$ ./verifica.sh verifica.sh
		verifica.sh existe

	O comando [ testou a presença do ficheiro **verifica.sh**. Neste caso, o ficheiro existe.

- **b) Altere o script de forma a que, caso o ficheiro exista, indique também se é executável**

```
#!/bin/bash

if [[ -x $1 ]]; then
	echo "$1 existe e é executável"
elif [ -f $1 ]; then
	echo "$1 existe"
else
	echo "$1 não existe"
fi
```

### 19. Utilize o programa `gedit` para criar o script: **tabuada.sh**, na diretoria base, com o conteúdo:

```
#!/bin/bash
i=0
while [ $i -lt 10 ]; do
    echo "Valor de i: $i"
    i=$(( $i+1 ))
done
```

- **a) Altere-o de forma a escrever a tabuada de um número qualquer entre 1 e 9, por exemplo o 7**

```
#!/bin/bash
i=7
while [ $i -lt 71 ]; do
	echo "Valor de i: $i"
	i=$(( $i+7 ))
done
```

- **b) Altere o script de forma a que possa receber o número como argumento**

```
#!/bin/bash

## Cria um while statement com 10 loops, que multiplica o número inserido pelo utilizador e lido pelo comando `read`, multiplicando o mesmo pelo valor de $i (que começa em 1 mas vai incrementando em 1 no final de cada loop) e guardando o resultado na variável $res. Depois, faz print de uma string que utiliza os valores de cada variável de forma a imprimir uma expressão matemática do género 2 x 1 = 2.

echo "Insira um número: "
read num
i=1
while [ $i -lt 11 ]; do
	res=$(( num * i ))
	echo "$num x $i = $res"
	i=$(( $i+1 ))
done
```

### 20. Utilizando o editor de texto que preferir, faça um programa em shell que gera um número aleatório, usando a variável $RANDOM, e pede ao utilizador para adivinhar esse número. A cada tentativa, o programa deverá indicar se o número introduzido é "muito pequeno", "muito grande" ou se "acertou". No final, deverá ser indicado o número de tentativas usadas.

```
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
```
