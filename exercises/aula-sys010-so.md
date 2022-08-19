# Exercicios Sistemas Operativos - Shell

### 1. Abra uma Shell no Linux (VM criada no VirtualBox). Como se chama o programa que utilizou para trabalhar na Shell?
<p>

> Terminal, gnome-terminal, Konsole, etc. Depende do [emulador de terminal](https://en.wikipedia.org/wiki/Terminal_emulator) que temos instalado no nosso sistema.

[Lista de emuladores de terminal](https://en.wikipedia.org/wiki/List_of_terminal_emulators)

### 2. Foi-lhe pedido que crie um utilizador no sistema Linux com username "utilizador1" e password "i5t0e1Pas$w0rd5egura".
<p>

- **a) Qual é o comando mais simples que serve para criar outros utilizadores?**

        $ useradd

    Debian e Ubuntu têm a ferramenta interactiva "adduser".

- **b) Qual utilizador pode criar outros utilizadores?**

    Qualquer utilizador com direitos administrativos no sistema.

- **c) Que dados precisa fornecer na criação do utilizador?**

    Username

        $ sudo useradd username

- **d) E quais desses dados são opcionais?**

    Password, grupos, etc.

- **e) Que elementos foram criados com a criação deste utilizador?**

    Adiciona uma linha nos ficheiros /etc/passwd, /etc/shadow/, /etc/group e /etc/gshadow.

### 3. Ainda dentro da mesma shell, mude de utilizador para o utilizador "Utilizador1".
<p>

- **a) Que comandos teve que usar?**

        $ su Utilizador1

- **b) Conseguiu mudar de utilizador? Porquê?**

    Não, pois o utilizador criado anteriormente é "utilizador1" e não "Utilizador1". Sistemas Linux são case-sensitive e portanto o sistema não reconhece "Utilizador1".

- **c) Mude para o utilizador que criou anteriormente em 2.1)**

        $ su utilizador1

- **d) Qualquer utilizador do sistema pode comutar para qualquer outro utilizador do mesmo sistema?**

    Sim, desde que tenha as credenciais do utilizador para o qual quer comutar.

- **e) Escreva o comando que permite ver qual é a diretoria atual.**

        $ pwd

- **f) A diretoria atual é a home directory do utilizador "utilizador1"?**

    A diretoria atual do utilizador1 é a diretoria onde o utilizador anterior se encontrava no momento em que comutou para o "utilizador1."

- **g) Qual o comando para sair desta sessão com este utilizador?**

        $ exit

- **h) Como conseguiria fazer login no utilizador anterior para entrar na home directory correta? Verifique que dessa forma funciona**

        $ su - utilizador1

- **i) Saia da conta do utilizador "utilizador1" (logout)**

        $ logout

        ou CTRL-D

    > What signal is Ctrl-D?

    >Ctrl + D is not a signal, it’s EOF (End-Of-File). It closes the stdin pipe. If read(STDIN) returns 0, it means stdin closed, which means Ctrl + D was hit (assuming there is a keyboard at the other end of the pipe).

    [Fonte](https://frameboxxindore.com/linux/frequent-question-what-does-ctrl-d-do-in-linux.html) //
    [Ler mais](https://unix.stackexchange.com/questions/110240/why-does-ctrl-d-eof-exit-the-shell)
<p>

### 4. Justifique o resultado de cada um dos seguintes comandos:
<p>

- **a) echo "Hello World"; echo "Ola Mundo"**

        $ echo "Hello World"; echo "Ola Mundo"
        Hello World
        Ola Mundo

    Executa ambos os comandos de echo e faz print das strings definidas.

- **b) echo -n "Hello World"; echo -n "Ola Mundo"**

        $ echo -n "Hello World"; echo -n "Ola Mundo"
        Hello WorldOla Mundo

    O parametro -n não cria uma nova linha a seguir ao print.

- **c) echo $USER**

        $ echo $USER
        serveneus

    Faz print do username atual.

- **d) so="Sistemas Operativos"**

    Não há output no terminal pois estamos apenas a definir uma variável.

- **e) x=3**

    Não há output no terminal pois estamos apenas a definir uma variável.

- **f) echo $so $x**

        $ echo $so $x
        Sistemas Operativos 3

    Faz print das duas variáveis definidas nas duas alineas anteriores.

- **g) echo $so$x**

        $ echo $so$x
        Sistemas Operativos3

    Faz print das duas variáveis definidas nas duas alineas anteriores, sem espaço entre elas.

- **h) echo $so3**

    Não faz print de nada, pois a variável $so3 não existe.

- **i) echo ${so}3**

        $ echo ${so}3
        Sistemas Operativos3

    Faz expansão da expressão {so}

- **j) echo $x+10**

        $ echo $x+10
        3+10

    Faz print da variável $x e acrescenta +10 ao final da string.

- **k) echo $(($x+10))**

        $ echo $(($x+10))
        13

    Faz expansão aritmética, uma funcionalidade do bash, permitindo que a expressão entre (( )) seja calculada matematicamente. Faz a expansão da variável $x e depois efectua o cálculo.


<p>

### 5. Justifique o resultado de cada um dos seguintes comandos:
<p>

- **a) FILE="/home/upskill1/teste/compressedfile.tar.gz"**

    Define a variável $FILE.

- **b) echo $FILE**

        $ echo $FILE
        /home/upskill1/teste/compressedfile.tar.gz

    Expande a variável $FILE e faz print do seu conteúdo.

- **c) basename $FILE**

        $ basename $FILE
        compressedfile.tar.gz

    O comando `basename` remove a parte inicial do path de um ficheiro, deixando só o nome do próprio ficheiro (daí o nome basename)
<p>

> #### --> Exercícios Bash Parameter Expansion [GNU Bash Manual](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) [Bash Hackers Wiki](https://wiki.bash-hackers.org/syntax/pe)
<p>

- **d) echo ${FILE%/*}**

        $ echo ${FILE%/*}
        /home/upskill1/teste

- **e) echo ${FILE##*/}**

        $ echo ${FILE##*/}
        compressedfile.tar.gz

- **f) echo "${FILE#*.}"**

        $ echo "${FILE#*.}"
        tar.gz

- **g) echo "${FILE##*.}"**

        $ echo "${FILE##*.}"
        gz

- **h) echo ${FILE%%.*}**

        $ echo ${FILE%%.*}
        /home/upskill1/teste/compressedfile

- **i) echo ${FILE%.*}**

        $ echo ${FILE%.*}
        /home/upskill1/teste/compressedfile.tar

- **j) echo $PWD**

        $ echo $PWD
        /home/serveneus

- **k) echo ${PWD##*/}**

        $ echo ${PWD##*/}
        serveneus

<p>

### 6. Justifique o resultado de cada um dos seguintes comandos:
<p>

- **a) echo app1; echo app2; cd naoexisto; echo app3; echo app4**

        $ echo app1; echo app2; cd naoexisto; echo app3; echo app4
        app1
        app2
        bash: cd: naoexisto: No such file or directory
        app3
        app4

    Corre todos os comandos, mesmo quando um deles dá erro.

- **b) echo app1 && echo app2 && cd naoexisto && echo app3 && echo app4**

        $ echo app1 && echo app2 && cd naoexisto && echo app3 && echo app4
        app1
        app2
        bash: cd: naoexisto: No such file or directory

    && é um operador lógico "AND". Os comandos são executados enquanto o exit code for 0. `app3` e `app4` não foram executados pois `cd naoexisto` devolveu um erro (exit code 1).

- **c) echo app1 || echo app2 || cd naoexisto || echo app3 || echo app4**

        $ echo app1 || echo app2 || cd naoexisto || echo app3 || echo app4
        app1

    || é um operador lógico "OR". A shell executa `echo app1` ou `echo app2`. Só executa o segundo comando caso o primeiro tenha um exit code 1 (erro). Como neste caso `echo app1` concluiu com sucesso, a shell não executou nenhum dos outros comandos.

- **d) echo app1 && echo app2 && cd naoexisto && echo app3 || echo app4**

        $ echo app1 && echo app2 && cd naoexisto && echo app3 || echo app4
        app1
        app2
        bash: cd: naoexisto: No such file or directory
        app4

    `cd naoexisto` retorna exit code 1 e já não é executado `echo app3`. No entanto, visto que `echo app3` não foi executado, existe um operador lógico || "OR" que permite a execução de `echo app4`.

### 7. Escreva um comando que lhe permita contar o número de palavras do seu nome

        $ echo "Catarina Soeiro" | wc -w

### 8. Escreva um comando que apresenta todos os números de 1 a 50

        $ echo {1..50}

### 9. Crie, a partir da diretoria atual, a seguinte estrutura de diretórios:
<p>

![Pastas](/assets/images/pastas.png)

- **a) Apenas usando a linha de comandos**

        $ mkdir -p base/{modulos/{sistemas-operativos,redes,cloud},cores/{amarelo,laranja,vermelho/{carmim,encarnado}},numeros,testes}

- **b) Escreva um comando que mostre toda a estrutura**

        $ tree

- **c) Se não conseguiu executar, instale o pacote correspondente**

        $ sudo apt install tree

- **d) Posicione-se na diretoria Carmim**

        $ cd base/cores/vermelho/carmim

- **e) Utilizando um único comando, mostre a estrutura cores**

        $ tree base/cores

- **f) Utilizando um único comando, vá para a diretoria cloud**

        $ cd ../../../modulos/cloud

- **g) Remova a diretoria testes**

        $ rmdir ../../testes

- **h) Crie, debaixo da diretoria numeros, 200 diretorias, com os nomes dir_1, dir_2, dir_3, ..., dir_199, dir_200**

        $ mkdir ../../numeros/dir_{1..200}

### 10. Tomando como base a estrutura de diretórios anterior:

- **a) Crie um ficheiro vazio na diretoria base chamado “semnada.txt”**

        $ touch base/semnada.txt

- **b) Escreva um comando que cria na base um ficheiro “path.txt” com o conteúdo da variável PATH**

        $ echo $PATH > base/path.txt

- **c) Escreva um comando que adiciona ao ficheiro “path.txt” uma linha com o seu nome**

        $ echo "Catarina" >> base/path.txt

- **d) Crie na diretoria base um ficheiro “users.txt” com o conteúdo do ficheiro /etc/passwd**

        $ cp /etc/passwd base/users.txt

- **e) Crie na diretoria base um soft-link chamado “etcpasswd” que aponta para o ficheiro /etc/passwd**

        $ ln -s /etc/passwd base/etcpasswd

- **f) Escreva um comando que adiciona ao ficheiro “users.txt” o texto "texto acrescentado no final". Verifique se o texto foi escrito. Justifique.**

        $ echo "texto acrescentado no final" >> base/users.txt

- **g) Escreva um comando que adiciona ao ficheiro “etcpasswd” o texto "texto acrescentado no final". Verifique se o texto foi escrito. Justifique.**

        $ echo "texto acrescentado no final" >> base/etcpasswd

    Não é possível escrever neste ficheiro sem permissões de superuser pois este ficheiro só é editável pelo root (ou com o comando sudo).

- **h) Mostre no ecrã as diferenças entre o ficheiro “users.txt” e o ficheiro “etcpasswd”**

        $ diff base/users.txt base/etcpasswd
        44d43
        < texto acrescentado no final

### 11. Tomando como base a estrutura de diretórios anterior:

- **a) Mova o ficheiro "users.txt" para a diretoria Carmim**

        $ mv base/users.txt base/cores/vermelho/carmim

- **b) Crie um hard-link na base para o ficheiro users.txt chamado "hard-users.txt"**

        $ ln base/cores/vermelho/carmim/users.txt base/hard-users.txt

- **c) Confirme que o conteúdo de "hard-users.txt" é igual ao de "users.txt"**

        $ diff base/hard-users.txt base/cores/vermelho/carmim/users.txt

- **d) Aponte o tamanho do ficheiro "hard-users.txt", e confirme que é igual ao tamanho de "users.txt"**

        $ ls -la base
        total 12
        drwxr-xr-x. 1 utilizador1 utilizador1  112 Aug 18 11:25 .
        drwx------. 1 utilizador1 utilizador1  154 Aug 18 11:25 ..
        drwxr-xr-x. 1 utilizador1 utilizador1   44 Aug 17 23:47 cores
        lrwxrwxrwx. 1 utilizador1 utilizador1   11 Aug 17 23:48 etcpasswd -> /etc/passwd
        -rw-r--r--. 2 utilizador1 utilizador1 2469 Aug 17 23:48 hard-users.txt
        drwxr-xr-x. 1 utilizador1 utilizador1   58 Aug 17 23:47 modulos
        drwxr-xr-x. 1 utilizador1 utilizador1    0 Aug 17 23:47 numeros
        -rw-r--r--. 1 utilizador1 utilizador1  110 Aug 17 23:47 path.txt
        drwxr-xr-x. 1 utilizador1 utilizador1    0 Aug 17 23:47 testes

        $ ls -la base/cores/vermelho/carmim
        total 4
        drwxr-xr-x. 1 utilizador1 utilizador1   18 Aug 18 11:25 .
        drwxr-xr-x. 1 utilizador1 utilizador1   30 Aug 17 23:47 ..
        -rw-r--r--. 2 utilizador1 utilizador1 2469 Aug 17 23:48 users.txt

	Ambos os ficheiros tem 2469 bytes.

- **e) Crie um soft link na base para o ficheiro users.txt chamado "soft-users.txt"**

		$ ln -s ~/base/cores/vermelho/carmim/users.txt base/soft-users.txt

- **f) Confirme que o conteúdo de "soft-users.txt" é igual ao de "users.txt"**

		$ diff base/soft-users.txt base/cores/vermelho/carmim/users.txt

- **g) Aponte o tamanho do ficheiro "soft-users.txt", e justifique porque é diferente do tamanho de "users.txt"**

		$ ls -la base
		total 16
		drwxr-xr-x. 1 utilizador1 utilizador1  140 Aug 18 11:43 .
		drwx------. 1 utilizador1 utilizador1  154 Aug 18 11:25 ..
		drwxr-xr-x. 1 utilizador1 utilizador1   44 Aug 17 23:47 cores
		lrwxrwxrwx. 1 utilizador1 utilizador1   11 Aug 17 23:48 etcpasswd -> /etc/passwd
		-rw-r--r--. 2 utilizador1 utilizador1 2469 Aug 17 23:48 hard-users.txt
		drwxr-xr-x. 1 utilizador1 utilizador1   58 Aug 17 23:47 modulos
		drwxr-xr-x. 1 utilizador1 utilizador1    0 Aug 17 23:47 numeros
		-rw-r--r--. 1 utilizador1 utilizador1  110 Aug 17 23:47 path.txt
		lrwxrwxrwx. 1 utilizador1 utilizador1   54 Aug 18 11:43 soft-users.txt -> /home/utilizador1/base/cores/vermelho/carmim/users.txt
		drwxr-xr-x. 1 utilizador1 utilizador1    0 Aug 17 23:47 testes

	O tamanho do soft link "soft-users.txt" é apenas 54 bytes comparado com o ficheiro original "users.txt" que tem 2469 bytes, pois um soft link é um tipo de ficheiro especial que refere-se a outro ficheiro apenas pelo seu nome. Qualquer operação (abrir, escrever, ler, etc.) feita no soft link é automaticamente redirecionada pelo kernel que vai realizar a operação no ficheiro original.

- **h) Acrescente uma linha ao ficheiro users.txt com a data e hora atuais. Verifique que ambos os ficheiros “hard-users.txt” e “soft-users.txt” foram também alterados**

		$ date >> base/cores/vermelho/carmim/users.txt
		$ cat base/hard-users.txt
		$ cat base/soft-users.txt

	Ambos os ficheiros reflectem as alterações efectuadas.

- **i) Mova o ficheiro “users.txt” novamente para a base, e veja o que acontece aos ficheiros “hard-users.txt” e “soft-users.txt”**

		$ mv base/cores/vermelho/carmim/users.txt base/users.txt
		$ ls -la base
		total 20
		drwxr-xr-x. 1 utilizador1 utilizador1  158 Aug 18 11:53 .
		drwx------. 1 utilizador1 utilizador1  154 Aug 18 11:46 ..
		drwxr-xr-x. 1 utilizador1 utilizador1   44 Aug 17 23:47 cores
		lrwxrwxrwx. 1 utilizador1 utilizador1   11 Aug 17 23:48 etcpasswd -> /etc/passwd
		-rw-r--r--. 2 utilizador1 utilizador1 2502 Aug 18 11:50 hard-users.txt
		drwxr-xr-x. 1 utilizador1 utilizador1   58 Aug 17 23:47 modulos
		drwxr-xr-x. 1 utilizador1 utilizador1    0 Aug 17 23:47 numeros
		-rw-r--r--. 1 utilizador1 utilizador1  110 Aug 17 23:47 path.txt
		lrwxrwxrwx. 1 utilizador1 utilizador1   54 Aug 18 11:43 soft-users.txt -> /home/utilizador1/base/cores/vermelho/carmim/users.txt
		drwxr-xr-x. 1 utilizador1 utilizador1    0 Aug 17 23:47 testes
		-rw-r--r--. 2 utilizador1 utilizador1 2502 Aug 18 11:50 users.txt
		$ cat base/hard-users.txt
		$ cat base/soft-users.txt
		cat: base/soft-users.txt: No such file or directory

	O hard link mantem-se e faz print de todo o conteúdo do ficheiro como anteriormente. O soft link "quebra-se" e deixa de funcionar, pois a localização para onde este referenciava deixou de existir.

- **j) Mostre o real conteúdo do ficheiro “soft-users.txt”**

		$ readlink base/soft-users.txt

- **k) Acrescente uma linha ao ficheiro users.txt com a data e hora atuais. Verifique que ambos os ficheiros “hard-users.txt” e “soft-users.txt” foram também alterados**

		$ date >> base/users.txt
		$ cat base/hard-users.txt
		$ cat base/soft-users.txt
		cat: base/soft-users.txt: No such file or directory

	O hard link foi alterado, tal como o ficheiro original. No entanto, o soft link continua sem destinatário válido e por isso não foi possível registar nenhuma alteração (nem é possível aceder aos conteúdos do ficheiro através do soft link).

- **l) Volte a mover o ficheiro “users.txt” para a diretoria Carmim e verifique como ficam o ficheiros links criados.**

		$ mv base/users.txt base/cores/vermelho/carmim
		$ cat base/hard-users.txt
		$ cat base/soft-users.txt

	Ambos os links estão funcionais e reflectem todas as alterações realizadas anteriormente.

### 12. Tomando como base a estrutura de diretórios anterior, justifique o output:

- **a) cat soft-users.txt**

		$ cd base	##	mudar a diretoria actual para "base", pois sem isto estaremos na diretoria errado.
		$ cat soft-users.txt

	Faz print no terminal de todo o conteúdo do ficheiro "users.txt", ao qual o soft "soft-users.txt" está ligado.

- **b) cat soft-users.txt | head**

		$ cat soft-users.txt | head
		root:x:0:0:root:/root:/bin/bash
		bin:x:1:1:bin:/bin:/sbin/nologin
		daemon:x:2:2:daemon:/sbin:/sbin/nologin
		adm:x:3:4:adm:/var/adm:/sbin/nologin
		lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
		sync:x:5:0:sync:/sbin:/bin/sync
		shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
		halt:x:7:0:halt:/sbin:/sbin/halt
		mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
		operator:x:11:0:operator:/root:/sbin/nologin

	Lê o ficheiro soft-users.txt e mostra as primeiras 10 linhas do ficheiro.

- **c) cat soft-users.txt | tail -8**

		$ cat soft-users.txt | tail -8
		tcpdump:x:72:72::/:/sbin/nologin
		systemd-coredump:x:982:982:systemd Core Dumper:/:/usr/sbin/nologin
		systemd-timesync:x:981:981:systemd Time Synchronization:/:/usr/sbin/nologin
		serveneus:x:1000:1000:serveneus:/home/serveneus:/bin/bash
		utilizador1:x:1001:1001::/home/utilizador1:/bin/bash
		texto acrescentado no final
		Thu Aug 18 11:50:25 AM WEST 2022
		Thu Aug 18 12:01:48 PM WEST 2022

	Lê o ficheiro soft-users.txt e mostra as últimas 8 linhas do ficheiro.

- **d) cat soft-users.txt | grep "daemon"**

		$ cat soft-users.txt | grep "daemon"
		daemon:x:2:2:daemon:/sbin:/sbin/nologin
		avahi:x:70:70:Avahi mDNS/DNS-SD Stack:/var/run/avahi-daemon:/sbin/nologin

	Lê o ficheiro soft-users.txt e mostra as linhas dentro do ficheiro que contenham a string "daemon".

- **e) cat soft-users.txt | grep "daemon" | wc –l**

		$ cat soft-users.txt | grep "daemon" | wc -l
		2

	Lê o ficheiro soft-users.txt, filtradas as linhas dentro do ficheiro que contenham a string "daemon" e faz print do número exacto de linhas filtradas.

- **f) echo *.txt**

		$ echo *.txt
		hard-users.txt path.txt soft-users.txt

	Faz print de todos os nomes de ficheiros acabados em .txt.

- **g) echo s*.txt**

		$ echo s*.txt
		soft-users.txt

	Faz print de todos os ficheiros começados com s e acabados em .txt.

- **h) echo *-users.txt**

		$ echo *-users.txt
		hard-users.txt soft-users.txt

	Faz print de todos os ficheiros acabados em *-users.txt.

### 13. Utilize o `tee` para criar o ficheiro **p1.sh**, na diretoria base, com o conteúdo:
<p>

> #!/bin/bash
>
> echo "Olá malta!"
>
> echo -n "Hora atual: "
>
> date
>
> echo "Adeus"

- **a) Verifique que o ficheiro foi bem criado, usando os comandos:**

		$ cat ./p1.sh
		$ ls -l

- **b) Execute o ficheiro, tendo em conta que antes lhe deve dar permissões de execução:**

		$ chmod +x ./p1.sh
		$ ./p1.sh

- **c) Modifique o programa de forma a também mostrar o nome da diretoria atual**

		#!/bin/bash

		echo "Olá malta!"
		echo -n "A hora atual é: "
		date
		echo "O diretório atual é: $PWD"
		echo "Adeus"

- **d) Modifique o programa de forma a listar o conteúdo da diretoria atual**

		#!/bin/bash

		echo "Olá malta!"
		echo -n "A hora atual é: "
		date
		echo "O diretório atual é: $PWD"
		echo "O conteúdo do diretório é: "
		echo "$(ls)"
		echo "Adeus"

### 14. Utilize o `vi` para criar o ficheiro **conteudo.txt**, na diretoria base, com o conteúdo:

Escreva um comando que permita:

- **a) obter o número de linhas do ficheiro:**

		$ wc -l conteudo.txt

- **b) mostrar as duas últimas linhas do ficheiro:**

		$ cat conteudo.txt | tail -2

- **c) mostrar as primeiras três linhas do ficheiro:**

		$ cat conteudo.txt | head -3

- **d) mostrar as linhas relativas a alunos com número começado por 5 (cinquenta mil e ...)**

		$ cat conteudo.txt | egrep "^5"

- **e) mostrar o nome de cada uma das pessoas**

		$ awk '{print $2}' conteudo.txt

- **f) mostrar o nome e o número de cada uma das pessoas**

		$ awk '{print $1, $2}' conteudo.txt

- **g) mostrar o nome dos estudantes**

		$ cat conteudo.txt | grep estudante

- **h) mostrar o nome dos estudantes do sporting (quem quiser pode fazer do benfica)**

		$ cat conteudo.txt | grep "estudante" | grep "sporting" | awk '{print $2}'

- **i) mostrar o nome dos estudantes, ordenados por ordem alfabética**

		$ cat conteudo.txt | grep "estudante" | awk '{print $2}' | sort

- **j) mostrar a lista de equipas, ordenada e sem repetições**

		$ awk '{print $3}' conteudo.txt | sort | uniq

- **k) contar o número de equipas diferentes que estão mencionadas**

		$ awk '{print $3}' conteudo.txt | sort | uniq | wc -l

- **l) criar um ficheiro a partir deste, no qual "rui" passa a estar com maiúscula**

		$ sed 's/rui/Rui/g' conteudo.txt > conteudo2.txt

- **m) criar um ficheiro com o nome e o número da conta (3º elemento do NIB)**

		$ awk -F [\ -] '{print $2, $6}' conteudo.txt > conteudo3.txt

- **n) calcular o maior saldo**

		$ awk '{print $6}' conteudo.txt | sort -nr

- **o) ver o nome de quem tem maior saldo**

		$ awk '{print $2, $6}' conteudo.txt | sort -n -k 2 | tail -1

- **p) calcule o número da linha, cujo início contém a sequência 55002**

		$ cat conteudo.txt | grep -n 55002 | cut -d ':' -f 1
