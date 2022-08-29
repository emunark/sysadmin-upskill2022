### 26. Analise o script write-stdout.sh apresentado em seguida:

- a) Indique o que faz cada uma das três validações?

A primeira validação testa existência de dois argumentos. A segunda validação usa uma expressão regular que testa se o primeiro argumento corresponde à expressão definida. A última validação determina se o valor do argumento 1 é igual ou inferior a 10.

- b) Indique globalmente o que faz este script?

O script é um loop escreve a frase passada pelo argumento 2, tomando o valor do argumento 1 como parametro para o comando sleep, que vai determinar o valor em segundos para o intervalo entre cada loop.

- c) Execute o script e verifique as validações e a execução do mesmo.

```
$ ./write-stdout.sh
Falhou validação 1
$ ./write-stdout.sh aa test
Falhou validação 2
$ ./write-stdout.sh 11 teste
Falhou validação 3
$ ./write-stdout.sh 2 "Linux Rules"
09:33:31: Escrevi a frase: Linux Rules
09:33:33: Escrevi a frase: Linux Rules
09:33:35: Escrevi a frase: Linux Rules
^C
```

- d) Execute o script: `./write-stdout 2 "Linux Rules"`

```
$ ./write-stdout.sh 2 "Linux Rules"
09:33:31: Escrevi a frase: Linux Rules
09:33:33: Escrevi a frase: Linux Rules
09:33:35: Escrevi a frase: Linux Rules
^C
```

- e) Enquanto o script estiver a executar, pressione CTRL+Z e analise o comportamento resultante

```
$ ./write-stdout.sh 2 "Linux Rules"
09:35:33: Escrevi  a frase: Linux Rules
09:35:35: Escrevi  a frase: Linux Rules
09:35:37: Escrevi  a frase: Linux Rules
^Z
[1]+  Stopped                 ./write-stdout.sh 2 "Linux Rules"
```

O processo foi interrompido após pressionar CTRL-Z, permitindo o acesso à linha de comandos novamente.

- f) Abra outra consola, e nessa nova consola dê o seguinte comando: `$ ps -u <user> | grep write-stdout.sh` O que pode concluir do resultado?

```
ps -u cat | grep write-stdout.sh
  501  2152 ttys000    0:00.01 /bin/bash ./write-stdout.sh 2 Linux Rules
```

O processo `./write-stdout.sh 2 Linux Rules` está a correr na shell /bin/bash sob o user 501.

- g) Na primeira consola, dê o comando `jobs`. O que é apresentado? Agora dê o comando `fg` O que acontece?

```
$ jobs
[1]+  Stopped                 ./write-stdout.sh 2 "Linux Rules"

$ fg
./write-stdout.sh 2 "Linux Rules"
09:40:11: Escrevi  a frase: Linux Rules
09:40:13: Escrevi  a frase: Linux Rules
09:40:15: Escrevi  a frase: Linux Rules
```

O comando `jobs` apresenta todos os jobs actualmente em execução (ou não) na shell. Quando executamos o comando `fg`, este traz de volta ao foreground o comando ./write-stdout.sh que estava interrompido no background.

- h) Pressione novamente CTRL+Z. Tendo acesso a uma nova prompt, execute: `./write-stdout 2 "the World"`

- i) Pressione novamente CTRL+Z. Na segunda consola dê novamente o comando `ps -u <user> | grep write-stdout.sh`, e na primeira, novamente o comando `jobs`. O que é apresentado?

```
ps -u cat | grep write-stdout.sh
  501  2152 ttys000    0:00.01 /bin/bash ./write-stdout.sh 2 Linux Rules
  501  2732 ttys002    0:00.00 /bin/bash ./write-stdout.sh 2 the World
```

São apresentadas duas linhas, cada uma com os jobs criados anteriormente e actualmente em background.

- j) Na primeira consola, dê o comando `bg`. O que aconteceu? Dê comandos como `ls` e perceba que funcionam. Porquê?

Ao darmos `bg`, a shell começou a correr novamente o script que estava interrompido em background e mostra o output do mesmo. No entanto, ainda temos o controlo da shell e é possível executar outros comandos.

- k) Na mesma consola, dê o comando `jobs`. Dê agora o comando `fg`. O que acontece?

O comando jobs todos os jobs a correr atualmente naquela consola e o comando fg trá-lo para o foreground.

- l) Se pressionar CTRL+C o que acontece ao primeiro script? Porquê?

O processo é terminado imediatamente.

- m) Como consegue parar o segundo script?

Na segunda consola, executar:

```
$ jobs
[1]  + suspended  ./write-stdout.sh 2 "the World"
$ fg
fg
[1]  + 2732 continued  ./write-stdout.sh 2 "the World"
10:04:24: Escrevi  a frase: the World
10:04:26: Escrevi  a frase: the World
^C
```

### 27. Volte a correr o script $ ./write-stdout 2 "Linux Rules":

- a) Se pressionar CTRL+C o que acontece ao script? Porquê?

CTRL C envia o SIGINT para o processo e interrompe o mesmo.

- b) Volte a correr o script `$ ./write-stdout 2 "Linux Rules"`. Abra outra consola, e nessa nova consola dê o seguinte comando: `$ ps -u <user> | grep write-stdout.sh`. Guarde o PID do processo.

```
$ ps -u cat | grep write-stdout.sh
  501  2362 ttys001    0:00.03 /bin/bash ./write-stdout.sh 2 Linux Rules
```

O PID é 2362 (pode ser diferente noutra altura).

- c) Na segunda consola, execute `$ kill –SIGINT <PID>`. O que acontece?

-- O sinal não está a ser enviado com sucesso. INVESTIGAR

- d) Altere o script, escrevendo antes da linha “while true” o código:

    trap "echo Ai! Recebi um sinal!;echo" SIGINT SIGTERM
    trap -p

```
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
```

- e) Volte a correr o script $ ./write-stdout 2 "Linux Rules“

```
$ ./write-stdout.sh 2 "Linux Rules"
trap -- 'echo Ai! Recebi um sinal!;echo' SIGINT
trap -- 'echo Ai! Recebi um sinal!;echo' SIGTERM
11:26:17: Escrevi a frase: Linux Rules
```

- f) Se pressionar CTRL+C o que acontece ao script? Porquê?

```
$ ./write-stdout.sh 2 "Linux Rules"
trap -- 'echo Ai! Recebi um sinal!;echo' SIGINT
trap -- 'echo Ai! Recebi um sinal!;echo' SIGTERM
11:26:17: Escrevi a frase: Linux Rules
11:26:19: Escrevi a frase: Linux Rules
11:26:21: Escrevi a frase: Linux Rules
11:26:23: Escrevi a frase: Linux Rules
^CAi! Recebi um sinal!
```

O CTRL-C deixa de funcionar pois o sinal SIGINT está "trapped". Quando se pressiona CTRL-C, este ignora o sinal e faz echo da mensagem.

- g) Abra outra consola, e nessa nova consola dê o seguinte comando: `ps -u <user> | grep write-stdout.sh`. Guarde o PID do processo. Na segunda consola, execute `kill –SIGINT <PID>`. O que acontece?

```
$ ps -u cat | grep write-stdout.sh
  501  3204 ttys001    0:00.15 /bin/bash ./write-stdout.sh 2 Linux Rules
$ kill -SIGINT 3204
```

Ao enviar o sinal SIGINT, na outra consola o script faz echo da mensagem.

- h) E se executar, na segunda consola `kill –SIGTERM <PID>`? E se for apenas `kill <PID>`? Porquê?

Ao enviar o sinal SIGTERM, o script faz print da mensagem "Ai! Recebi um sinal". Executando `kill <PID>` resulta no mesmo pois por default o comando `kill` envia o SIGTERM.

- i) Então, como é que agora vamos terminar o processo?

    $ kill -9 3204