# Aula 019 - Redes - Aula Prática "Traffic Sniffing com a aplicação Wireshark"

## Conceito explorado: Equipamento físico (placa de rede) e loopback

1. Qual a razão pela qual precisou de arrancar a aplicação Wireshark como superuser?

```
O Wireshark vai capturar informação que está no kernel space, estando protegido por permissões de superutilizador.
```

2. Quais as interfaces de rede nas quais é possível capturar tráfego?

```
Em todas as interfaces activas no sistema, incluindo eth0 e lo (loopback).
```
## Conceito explorado: Protocol Data Unit - PDU

### **Análise à lista de pacotes capturados**

1. Quantos pacotes foram capturados?

```
Foram capturados 10 pacotes.
```

2. Quantas PDUs do protocolo HTTP foram trocadas?

```
Foram trocadas 2 PDUs do protocolo HTTP, o pedido e resposta.
```

3. Qual o tempo que decorreu entre a captura do pedido e da resposta HTTP?

```
Decorreram 0.001306s entre a captura do pedido inicial (PDU 1) e a primeira resposta (PDU 6).
```

### **Análise da informação detalhada de uma PDU**

Na lista de PDUs capturadas, em "Lista de pacotes", selecione o pedido HTTP (i.e. `GET`)

### **Anotação e comentários à informação de controlo (PCI) contida numa PDU de pedido HTTP.**

1. Identifique o conjunto de protocolos usados para a transferência deste pedido e represente-os na pilha protocolar do modelo de referencia TCP/IP.

```
Foram utilizados o protocolo ethernet (network access, troca de tramas), o protocolo IP (internet, troca de packets), o protocolo TCP (transport, troca de segmentos) e o protocolo HTTP.
```

2. Consultando a informação de controlo - PCI - da PDU do pedido HTTP indique qual o método e qual a versão do protocolo que é usado no pedido.

```
GET, HTTP 1.1
```

3. Consultando a informação de controlo dos diferentes protocolos indique os [SAP][1] que foram usados no pedido. (Considere essa utilização quer do lado do browser quer do lado do servidor Web.)

*Browser* | *Servidor Web*
--- | ---
**Aplicação** | **Aplicação**
TSAP (127.0.0.1:Port set by TCP) | TSAP (127.0.0.2:80) - HTTP
**Transporte** | **Transporte**
NSAP (127.0.0.1/6) - TCP | NSAP (127.0.0.2/6) - TCP
**Rede** | **Rede**
inet addr = 127.0.0.1 | inet addr = 127.0.0.2
---|---
MSAP (0x0800)
HWaddr = MAC Address

### **Informação de controlo PCI, dados e encapsulamento de uma resposta HTTP**

Na vista "Informação detalhada de pacote" selecione a resposta HTTP (i.e. `HTTP/1.1 200 OK`)

1. Para cada um dos níveis do modelo de referência TCP/IP preencha a seguinte tabela em que deverá indicar o tamanho (em bytes) da informação de controlo (PCI), dos dados (Payload) e da totalidade da unidade de dados de protocolo (PDU)[2].

Nível do modelo TCP/IP | PCI (bytes) | Dados (bytes) | PDU (bytes)
--- | --- | --- | ---
Aplicação | 282 | 118 | 400
Transporte | 32 | 400 | 432
Rede | 20 | 432 | 452
Acesso à Rede | 14 | 452 | 466


2. Calcule qual a taxa de utilização, n = Ldados / Ltotal, neste pedido no que se refere a:

    2.1. Dados da aplicação em relação à PDU de nível aplicação

        n = 118 / 400

    2.2. Dados da aplicação em relação aos octetos (bytes) trocados na interface ("wire")

        n = 118 / 466


---

## Notes:

[1]: The Service Access Point (SAP) is used to identify which protocol handler should process an incoming frame. A SAP is a data structure and identifier for a buffer area in system memory that is actually a broad concept. The Open Systems Interconnect (OSI) model uses a SAP to define the communication between layers (like Network, Transport, Session, and the other layers of the Seven-Layered Model).

- TSAP (Transport Service Access Point)
- NSAP (Network Service Access Point)
- MSAP (MAC Service Access Point)
    - Imaginem que a vossa máquina recebe uma mensagem na sua placa de rede. Essa mensagem não é mais do que um conjunto de bits, que a camada física vai acumulando e juntando até formar byte a byte.
    - A camada física recebeu 4144 bits, que converteu em 518 bytes
    - A camada Data Link não faz ideia do que esses 518 bytes contêm, nem precisa. A única coisa que ela precisa saber são os 14 bytes de informação que correspondem ao seu "envelope". Esses 14 bytes correspondem a 6 bytes de endereço MAC Src + 6 bytes de endereço MAC Dst + 2 bytes de MSAP
    - Os 2 bytes de MSAP irão dizer à camada Data Link A QUEM é que ela vai "entregar" o payload, o conteúdo da informação que está nos 518-14 bytes da mensagem. Podem haver vários serviços de Rede (Networking) a fazer tratamento da mensagem seguinte (e.g., IP, X.25, UUCP, etc.) o código, de 2 bytes, correspondente ao serviço IP é o valor hexadecimal 0x0800
    - Quando o serviço da camada Data Link lê esse código 0x0800, envia os restantes 518-14=504 bytes para o serviço IP, para que esse serviço trate da mensagem no nível 3
    [More info](https://en.wikipedia.org/wiki/EtherType)

![msap](/assets/images/msap.png)

Quanto ao processo de envio, é precisamente ao contrário, cada camada recebe o payload da camada superior, especifica o envelope (endereço Src e Dst) e manda para a camada de baixo, e assim sucessivamente.

[2]:

**Chapter 5 - Page 97 - TCP/IP Guide**

![encapsulation](/assets/images/pduencapsulation.png)