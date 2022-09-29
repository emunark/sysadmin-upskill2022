# Aula 026 - Redes - Exercicios

**Key Concept:**

[Aula 24](/notes/aula-sys024-redes.md)

Classless Inter-Domain Routing (CIDR) is a system of IP addressing and routing that solves the many problems of classful addressing by eliminating fixed address classes in favor of a flexible, multiple-level, hierarchical structure of networks of varying sizes.

# Cenário 1

![cenario1](/assets/images/aula26-cenario1.png)

1. Qual a máscara de rede que está a ser usada por cada um dos nós da rede?

255.255.255.128

2. Em que rede se encontra cada um destes nós?

192.168.10.128/25

Redes diferentes tem que ser ligados por um router, estes nós não estão ligados por um router. Por isso, estão na mesma rede.

3. Qual o endereço de broadcast remote em cada uma destas redes?

192.168.10.127 - Subnet 1

192.168.10.255 - Subnet 2

# Cenário 2

![cenario2](/assets/images/aula26-cenario2.png)

4. Qual a máscara de rede que está a ser usada por cada um dos nós da rede (pcx-1, pcx-2 e Router?)

255.255.255.192

5. Em que rede se encontra cada um destes nós?

```
rede 1 - 192.168.10.0/26
rede 2 - 192.168.10.64/26
rede 3 - 192.168.10.128/26
rede 4 - 192.168.10.192/26
```

PCX-1 (Rede 3)
PCX-2 (Rede 4)

6. Qual o endereço de broadcast remote em cada uma destas redes?

```
rede 1 - 192.168.10.63
rede 2 - 192.168.10.127
rede 3 - 192.168.10.191
rede 4 - 192.168.10.255
```

7. Embora se encontrem na mesma rede física (LAN) podem pcx-1 e pcx-2 trocar pacotes IP diretamente?

Podem trocar pacotes IP se o router estiver bem configurado.

8. Que endereço IP do router deve cada um dos PCs indicar como router para encaminhar tráfego IP?

PCX-1 deve indicar como gateway o 192.168.10.129

PCX-2 deve indicar como gateway o 192.168.10.193
