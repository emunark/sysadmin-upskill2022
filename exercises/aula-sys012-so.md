# Exercicios Sistemas Operativos - Shell

### 21. Utilize o `tee` para criar o ficheiro **conteudo.txt**, na diretoria base, com o conteúdo:

> 44444 Manuel 1990-01-31 sporting 0001-1002-12345234234-11 estudante 110.0
>
> 45323 Pedro 3000-02-23 benfica 0010-0302-00005234234-22 professor 120.3
>
> 43212 Maria 1998-13-28 porto 0011-0333-00008989898-33 Estudante 3333.3
>
> 46444 Vanessa 2003-3-8 sporting 0100-0444-00004444444-33 estudante 44.5
>
> 51002 Mariana 2002-11-34 braga 0100-0444-00004445555-23 estudante 1234.3
>
> 55002 rui 1996-12-6 sporting 0100-0444-00004445335-23 professor 2332.7
>
> 44000 David 19q8-07-21 benfica 0100-0444-00002322335-23 estudante 123.3

Escrever um comando que permita:

- **a) Mostrar todas as linhas que tenham a data de nascimento corretamente preenchida (formato YYYY-MM-DD)**

		$ egrep "[0-9]{4}-[0-9]{2}-[0-9]{2}" conteudo.txt

- **b) O mesmo que a) mas a data pode ter dois dígitos para mês e dia ou apenas um (i.e., MM ou M, e DD ou D)**

		$ egrep "[0-9]{4}-([0-9]{1,2})-([0-9]{1,2})" conteudo.txt

- **c) O mesmo que b) mas data tem de ter algumas validações: 1900 <= ano <= 2999, 1 <= mês <= 12, 1 <= Dia <= 31)**

		$ egrep "(1|2)[0-9]{3}-([1-9]|1[0-2]|0[1-9])-(0[0-9]|[1-2][0-9]|3(0|1)|[1-9])" conteudo.txt

- **d) Mostrar todas as linhas de todos os adeptos do benfica cujo ID começa com o caracter “4”**

		$ egrep "benfica" conteudo.txt | egrep "^4"

- **e) Mostrar todas as linhas com ID que terminam no caracter “2” (e.g., 51002)**

		$ egrep "^[0-9]{4}2" conteudo.txt

- **f) Mostrar todas as linhas com Nomes com 5 letras**

		$ egrep "^[0-9]{5}\ [a-zA-Z]{5}\ " conteudo.txt

- **g) Mostrar todas as linhas com pessoas que nasceram no ano 2000 ou depois (< 3000)**

		$ egrep "^[0-9]{5}\ [a-zA-Z]*\ 2[0-9]" conteudo.txt

- **h) Mostrar todas as linhas cujo NIB termina em 23, e.g., “0100-0444-00004445555-23”**

		$ egrep " 0[0-9]{3}-[0-9]{4}-[0-9]{11}-23 " conteudo.txt

### 22. Desenvolva os seguintes scripts Bash:

- **a) Script file-reader.sh:** script que recebe como argumento o nome de um ficheiro. Deve validar se recebe ou não o argumento, e se o ficheiro existe ou não (usando o comando test -e), e em caso de erro, sair indicando o erro. Caso contrário, deve ler todas as linhas do ficheiro, escrevendo no STDOUT linhas com o formato “Li em <HH:MM:SS> a linha <No Linha>: <Linha de texto>” (ou seja, incluindo a hora atual, e o número da linha atual – vindo de um contador). Quando terminar o ficheiro, deve terminar o script.

```
#!/usr/bin/env bash

# file-reader.sh: read a file line by line

(($# != 1)) && echo "Falta argumento." && exit 1 # tests for an argument
test ! -e "$1" && echo "Ficheiro nao existe." && exit 2 # tests for file existence

n_linha=1 # variable for line counter

while read linha; do
    echo "Li em $(date +%T) a linha $n_linha: $linha"
    ((n_linha++)) # increments the line counter
done < "$1" # reads the file in argument
```

- **b) Script file-writer.sh:** script que recebe como argumentos o nome de um ficheiro e uma frase (entre aspas). Deve validar se recebe ou não os argumentos, e se o ficheiro existe ou não (usando o comando test -e), e em caso de erro, sair indicando o erro. Caso contrário, deve escrever a frase passada no ficheiro, escrevendo também no STDOUT: “escrevi a frase: <frase> em <HH:MM:SS>” e termina o script.

```
#!/usr/bin/env bash

# file-writer.sh: Write a file with a given name and content.

# Usage: file-writer.sh <file-name> <file-content>

# Tests for an argument.
(($# != 2)) && echo "Falta argumento." && exit 1

# Tests for file existence.
test -e "$1" && echo "Ficheiro ja existe." && exit 2

# Writes the file with the given content.
echo "$2" > "$1"
echo "Escrevi a frase: \"$2\" em $(date +%T)" && exit 0
```

- **c) Teste o script file-reader.sh e file-writer.sh sem argumentos, ou passando um ficheiro inexistente e valide as mensagens de erro.**

```
$ ./file-reader.sh
Falta argumento.
$ $?
bash: 1: command not found
$ ./file-reader.sh naoexisto
Ficheiro nao existe.
$ $?
bash: 2: command not found
```

- **d) Crie um ficheiro usando o comando touch <file>, e verifique que o script file-writer.sh funciona e escreve strings no ficheiro.**

```
$ touch test
$ ./file-writer.sh test "this is a test"
Escrevi a frase: "this is a test" em 23:29:12
$ cat test
this is a test
```
- **e) Crie uma nova consola, e verifique que o script file-reader.sh funciona para ler o ficheiro criado em d)**

```
$ ./file-reader.sh test
Li em 23:32:35 a linha 1: this is a test
```

- **f) Crie um FIFO na diretoria /tmp (atenção, não é na vossa home directory, é na diretoria “root”+tmp), com o nome <nome user>**

```
$ mkfifo /tmp/serveneus
```

- **g) Ainda com as 2 consolas abertas, verifique que consegue correr o script file-reader.sh passando como argumento o FIFO criado**

```
$ ./file-reader.sh /tmp/serveneus
```

- **h) Na outra consola, verifique que consegue correr o script file-writer.sh para escrever no FIFO criado**

```
$ ./file-writer.sh /tmp/serveneus "testing fifo"
Escrevi a frase: "testing fifo" em 23:37:32
$ ./file-reader.sh /tmp/serveneus
Li em 23:37:32 a linha 1: testing fifo
```

- **i) Se conseguir, e estiver a correr num servidor remoto, peça a um colega (outro user) para correr o file-writer.sh dele com o seu FIFO criado. Funcionou? Porquê?**

### 23. Crie um ficheiro ficheiro-teste e valide as suas permissões e atributos, e, usando apenas um comando:

```
$ touch ficheiro-teste
$ stat ficheiro-teste
  File: "ficheiro-teste"
  Size: 0            FileType: Regular File
  Mode: (0644/-rw-r--r--)         Uid: (  501/     cat)  Gid: (   20/   staff)
Device: 1,18   Inode: 5395645    Links: 1
Access: Sun Aug 28 23:42:36 2022
Modify: Sun Aug 28 23:42:36 2022
Change: Sun Aug 28 23:42:36 2022
Birth: Sun Aug 28 23:42:36 2022
```

- **a) Dê permissões de escrita e execução aos utilizadores que não pertencem ao seu grupo, mantendo todos os outros atributos**

		$ chmod o+wx ficheiro-teste

- **b) Retire as permissões de leitura a todos os utilizadores (até a si), mantendo todos os outros atributos**

		$ chmod a-r ficheiro-teste

- **c) Tente ler o ficheiro e valide que não consegue, mas consegue escrever nele**

```
$ cat ficheiro-teste
cat: ficheiro-teste: Permission denied
$ echo "teste" > ficheiro-teste
```
- **d) Dê permissões de leitura apenas a si e ao seu grupo, mantendo todos os outros atributos**

		$ chmod u+r,g+r ficheiro-teste

- **e) Verifique que já consegue ler o ficheiro**

		$ cat ficheiro-teste
		teste

- **f) Dê permissões de leitura e remova a permissão de execução aos utilizadores que não pertencem ao seu grupo, mantendo todos os outros atributos**

		$ chmod o+r,o-x ficheiro-teste

- **g) Independentemente das permissões atuais, dê permissão de leitura e escrita a si, permissão de leitura ao seu grupo, e permissão de execução aos utilizadores que não pertencem ao seu grupo**

		$ chmod 641 ficheiro-teste

- **h) Independentemente das permissões atuais, não dê nenhuma permissão a si e ao seu grupo, e dê permissão de leitura, escrita e execução aos utilizadores que não pertencem ao seu grupo**

		$ chmod 007 ficheiro-teste

- **i) Tente ler o ficheiro e valide que não consegue, nem consegue escrever nele**

```
$ cat ficheiro-teste
cat: ficheiro-teste: Permission denied
$ echo "teste" >> ficheiro-teste
bash: ficheiro-teste: Permission denied
```

### 24. Ainda em relação ao ficheiro ficheiro-teste do exercício 23:

- **a) Dê o comando $ ls –l ficheiro-teste. Indique o que significa cada um dos campos apresentados. Verifique que não consegue ler o ficheiro pois não tem permissões.**

```
$ ls -l ficheiro-teste
-------rwx  1 cat  staff  6 29 Aug 00:25 ficheiro-teste
```
 	- file permissions (-------rwx)
	- number of (hard) links (1)
	- owner name (cat)
	- owner group (staff)
	- file size in bytes (6)
	- time of last modification (29 Aug 00:25)
	- file/directory name (ficheiro-teste)

- **b) Crie um soft link chamado soft-link1 que aponta para o ficheiro-teste, e outro soft-link chamado soft-link2 que aponta para o ficheiro “./ficheiro-teste”. Verificar que ambos links têm ativo o atributo “l”. Validar que, apesar de ambos links terem todas as permissões, não conseguimos ver o conteúdo de nenhum dos dois. Porquê?**

```
$ ln -s ficheiro-teste soft-link1
$ ln -s ./ficheiro-teste soft-link2
$ ls -l soft-link1 soft-link2
lrwxr-xr-x  1 cat  staff  14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff  16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
$ cat soft-link1 soft-link2
cat: soft-link1: Permission denied
cat: soft-link2: Permission denied
```

Não é possível aceder aos conteúdos dos soft links pois o ficheiro original para o qual estão a apontar não tem permissões de leitura.

- **c) Usando o comando ls -l, determine o tamanho de cada um dos links, veja que são diferentes (um tem 14, outro 16 bytes). Porquê? Use o comando readlink para ver o conteúdo dos dois links.**

```
$ readlink soft-link1
ficheiro-teste
$ readlink soft-link2
./ficheiro-teste
```

Os dois links têm tamanhos diferentes pois um deles contem dois caracteres extra.

- **d) Altere as permissões por forma a conseguir ver o conteúdo dos links soft-link1 e soft-link2. Valide que ambos têm o mesmo conteúdo. Crie mais um soft-link3, que aponta para /etc/passwd.**

```
$ chmod 600 ficheiro-teste
$ cat soft-link1 soft-link2
teste
teste
$ ln -s /etc/passwd soft-link3
```

- **e) Apague o ficheiro ficheiro-teste. Verifique o que aconteceu aos links?**

```
$ rm ficheiro-teste
$ cat soft-link1 soft-link2
cat: soft-link1: No such file or directory
cat: soft-link2: No such file or directory
```

Os links estão quebrados (e por isso deixaram de poder ser acedidos) pois o ficheiro para o qual apontavam foi apagado.

- **f) Crie novamente o ficheiro ficheiro-teste, agora com o conteúdo “New content”. O que aconteceu aos links?**

```
$ echo "New content" > ficheiro-teste
$ cat soft-link1 soft-link2
New content
New content
```

Os links foram restaurados e quando são acedidos refletem o novo conteúdo do ficheiro.

### 25. Ainda em relação ao ficheiro ficheiro-teste do exercício 23:

- **a) Dê o comando $ ls –l. Verifique que todos os ficheiros na diretoria têm o número a seguir aos atributos com o valor 1.**

```
$ ls -l
total 56
-rw-r--r--  1 cat  staff   12 29 Aug 00:44 ficheiro-teste
-rwxr-xr-x  1 cat  staff  424 28 Aug 23:22 file-reader.sh
-rwxr-xr-x  1 cat  staff  389 28 Aug 23:29 file-writer.sh
-rwxr-xr-x  1 cat  staff  182 20 Aug 16:12 p1.sh
-rwxr-xr-x  1 cat  staff  745 20 Aug 16:11 roulette.sh
lrwxr-xr-x  1 cat  staff   14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff   16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff   11 29 Aug 00:41 soft-link3 -> /etc/passwd
-rw-r--r--  1 cat  staff  653 20 Aug 16:12 tabuada.sh
-rw-r--r--  1 cat  staff  180 20 Aug 16:13 verifica.sh
```

- **b) Crie um hard link chamado hard-link1 que aponta para o ficheiro-teste. Verifique que este novo ficheiro não tem ativo o atributo “l”. Dê novamente o comando $ ls –l. Verifique novamente o número a seguir aos atributos dos vários ficheiros. Comente.**

```
$ ln ficheiro-teste hard-link1
$ ls -l hard-link1
-rw-r--r--  2 cat  staff  12 29 Aug 00:44 hard-link1
$ ls -l
total 64
-rw-r--r--  2 cat  staff   12 29 Aug 00:44 ficheiro-teste
-rw-r--r--  2 cat  staff   12 29 Aug 00:44 hard-link1
lrwxr-xr-x  1 cat  staff   14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff   16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff   11 29 Aug 00:41 soft-link3 -> /etc/passwd
```

Os valores de ficheiro-teste e hard-link1 indicam a existência de um hard link. O numero 2 representa um ficheiro original e um hard link.

- **c) Crie outro hard-link chamado hard-link2 que aponta para o ficheiro “./ficheiro-teste”. Verificar novamente que estes novos ficheiros não têm ativo o atributo “l”, e que o número a seguir aos atributos de alguns dos ficheiros aumentou novamente. Porquê?**

```
$ ln ficheiro-teste hard-link2
$ ls -l
total 72
-rw-r--r--  3 cat  staff   12 29 Aug 00:44 ficheiro-teste
-rw-r--r--  3 cat  staff   12 29 Aug 00:44 hard-link1
-rw-r--r--  3 cat  staff   12 29 Aug 00:44 hard-link2
lrwxr-xr-x  1 cat  staff   14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff   16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff   11 29 Aug 00:41 soft-link3 -> /etc/passwd
```

O número a seguir aos atributos aumentou novamente pois foi criado mais um hard link do ficheiro-teste, no total de três ficheiros: o original, o primeiro hard link e o segundo hard link acabado de criar.

- **d) Usando o comando ls -l, compare o tamanho, assim como os atributos, de cada um dos soft links e dos hard links. Justifique.**

```
$ ls -l *link*
-rw-r--r--  3 cat  staff  12 29 Aug 00:44 hard-link1
-rw-r--r--  3 cat  staff  12 29 Aug 00:44 hard-link2
lrwxr-xr-x  1 cat  staff  14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff  16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff  11 29 Aug 00:41 soft-link3 -> /etc/passwd
```

Os hard links têm tamanhos e atributos identicos e que coincidem com o tamanho e atributo do ficheiro original. No entanto, os soft links têm tamanhos e atributos distintos do ficheiro original, pois o conteúdo real destes links é apenas um path a apontar para o ficheiro original.

- **e) Altere as permissões do ficheiro ficheiro-teste. O que acontece às permissões dos soft links e dos hard links?**

```
$ chmod 777 ficheiro-teste
$ ls -l *link*
-rwxrwxrwx  3 cat  staff  12 29 Aug 00:44 hard-link1
-rwxrwxrwx  3 cat  staff  12 29 Aug 00:44 hard-link2
lrwxr-xr-x  1 cat  staff  14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff  16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff  11 29 Aug 00:41 soft-link3 -> /etc/passwd
```

Apenas se alteram as permissões dos hard links para reflectir as permissões do ficheiro-teste. Os soft links têm permissões independentes do ficheiro original.

- **f) Altere o conteúdo do hard-link1. O que acontece aos tamanhos dos soft links e dos hard links? E do ficheiro original?**

```
$ echo "new line" >> hard-link1
$ ls -l *link*
-rwxrwxrwx  3 cat  staff  21 29 Aug 01:14 hard-link1
-rwxrwxrwx  3 cat  staff  21 29 Aug 01:14 hard-link2
lrwxr-xr-x  1 cat  staff  14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff  16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff  11 29 Aug 00:41 soft-link3 -> /etc/passwd
$ ls -l ficheiro-teste
-rwxrwxrwx  3 cat  staff  21 29 Aug 01:14 ficheiro-teste
```

Os tamanhos dos soft links mantêm-se enquantos os hard links aumentam de tamanho para reflectir o conteúdo adicionado. Os hard links têm o mesmo tamanho do ficheiro original, ficheiro-teste.

- **g) Apague o ficheiro ficheiro-teste. Verifique o que aconteceu aos soft links, e aos hard links? Nos hard-links, repare no número a seguir aos atributos.**

```
$ rm ficheiro-teste
$ ls -l *link*
-rwxrwxrwx  2 cat  staff  21 29 Aug 01:14 hard-link1
-rwxrwxrwx  2 cat  staff  21 29 Aug 01:14 hard-link2
lrwxr-xr-x  1 cat  staff  14 29 Aug 00:34 soft-link1 -> ficheiro-teste
lrwxr-xr-x  1 cat  staff  16 29 Aug 00:35 soft-link2 -> ./ficheiro-teste
lrwxr-xr-x  1 cat  staff  11 29 Aug 00:41 soft-link3 -> /etc/passwd
```

O número de hard links diminuiu em 1 para reflectir a eliminação do ficheiro-teste. Os tamanhos de todos os links mantêm-se. No entanto, só os hard links podem ser acedidos, enquantos os soft links passam a estar quebrados e, como tal, inacessíveis.
