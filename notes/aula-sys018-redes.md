# Aula 018 - Redes

**What is a computer network?**

An interconnection of multiple devices, also known as hosts, that are connected using multiple paths for the purpose of sending/receiving data or media. Computer networks can also include multiple devices/mediums which help in the communication between two different devices; these are known as Network devices and include things such as routers, switches, hubs, and bridges. [More info](https://www.geeksforgeeks.org/network-devices-hub-repeater-bridge-switch-router-gateways/?ref=lbp)

[Video](https://youtu.be/1cS5JPULDdY?list=PLG49S3nxzAnnOmvg5UGVenB_qQgsh01uC)

---

## Brief History of Networks (Breve História de Redes)

- Sistemas começaram por ligar-se via terminais simples (teletype);

- Acesso a dados bancários em aplicações especializadas e únicas;

- Antes das redes de computadores existiam a rede telefónica e a rede de difusão de rádio e televisão;

- Comutação de pacotes (packet switching) inventada no final dos anos 60 permite dar a vida à rede ARPANET;

- Tim Berners-Lee inventa a World Wide Web (WWW) em 1989, implementando o protocolo HTTP para acesso às páginas da World Wide Web.

[World Wide Web != Internet - What is the difference?](https://www.lifewire.com/difference-between-the-internet-and-the-web-2483335)

---

## Goals of Networks (Motivações e exemplos de aplicação de redes de computadores)

[Link](https://www.geeksforgeeks.org/goals-of-networks/?ref=lbp)

- Resource Sharing

- High Reliability

- Inter-process Communication (IPC)

- Flexible access

---

## Types of Network Topology (Tipos de Topologia de Redes)

[Link](https://www.geeksforgeeks.org/types-of-network-topology/?ref=lbp)

The layout arrangement of the different devices in a network.

![topology](https://sf.ezoiccdn.com/ezoimgfmt/networkencyclopedia.com/wp-content/uploads/2020/11/topology-bus-star-ring-network-.jpg?ezimgfmt=ng:webp/ngcb2)

Common examples include:

* [Bus Network](https://networkencyclopedia.com/bus-topology/)
* [Star Network](https://networkencyclopedia.com/star-topology/)
* [Mesh Network]()
* [Ring Network](https://networkencyclopedia.com/token-ring/)
 

[Video](https://www.youtube.com/watch?v=zbqrNg4C98U)

---

## Types of area networks (Classificação das redes de computadores)

[Link](https://www.geeksforgeeks.org/types-of-area-networks-lan-man-and-wan/?ref=lbp)

- Personal area network (PAN)
- Local area network (LAN)
- Metropolitan area networks (MAN)
- Wide area networks (WAN)

[Video](https://youtu.be/lYIYcP4DSp8?list=PLG49S3nxzAnnOmvg5UGVenB_qQgsh01uC-9)

---

## Internetworks (Interligação de redes)

[Link 1](https://en.wikipedia.org/wiki/Internetworking)
[Link 2](https://ecomputernotes.com/computernetworkingnotes/computer-network/internetworks)

Internetworking is the practice of interconnecting multiple computer networks, such that any pair of hosts in the connected networks can exchange messages irrespective of their hardware-level networking technology. The resulting system of interconnected networks are called an internetwork, or simply an internet.

---

## OSI and TCP/IP Models

[OSI](https://www.geeksforgeeks.org/layers-of-osi-model/?ref=lbp) - OSI stands for Open Systems Interconnection. It is a reference model that specifies standards for communications protocols and also the functionalities of each layer. 

![OSITable](/assets/images/osimodel.png)

[TCP/IP](https://www.geeksforgeeks.org/tcp-ip-model/?ref=lbp) - The TCP/IP model is a concise version of the OSI model. It contains four layers, unlike seven layers in the OSI model.

[Video explanation for both models](https://www.youtube.com/watch?v=3b_TAYtzuho)

## [Differences between OSI and TCP/IP Model](https://testbook.com/learn/difference-between-tcp-ip-and-osi-model/)

![OSIvsTCP](/assets/images/osivstcp.jpg)

# Physical Layer (Part 1)

## Types of Transmission Media (Meios de Transmissão)

[Link](https://www.geeksforgeeks.org/types-transmission-media/?ref=lbp)

**1. Guided Media**

Also referred to as Wired or Bounded transmission media. Signals being transmitted are directed and confined in a narrow pathway by using physical links.

- Features:

    - High Speed
    - Secure
    - Used for comparatively shorter distances

**2. Unguided Media**

Also referred to as Wireless or Unbounded transmission media. No physical medium is required for the transmission of electromagnetic signals.

- Features:

    - The signal is broadcasted through air
    - Less Secure
    - Used for larger distances

![typesmedia](http://ecomputernotes.com/images/Types-of-Transmission-Media.jpg)

## Sharing Transmission Media (Partilha do meio de transmissão)

[Link](https://mike.passwall.com/networking/bcastvsppp.html)

- **Broadcast:** A method of sending a signal where multiple parties may hear a single sender.

- **Multicast:** Multicasting works in similar to Broadcasting, but in Multicasting, the information is sent to the targeted or specific members of the network. [More info](https://www.geeksforgeeks.org/multicasting-in-computer-network/)

- **Point-to-point:** A method of communication where one "point" (person or entity) speaks to another entity

## Transmission Modes (Transmissão de Dados)

[Link](https://www.geeksforgeeks.org/transmission-modes-computer-networks/?ref=lbp)

![transmission](/assets/images/transmissiontable.png)