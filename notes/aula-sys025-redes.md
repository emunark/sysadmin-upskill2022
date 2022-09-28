# Aula 025 - Redes

## Layer 4 - Transport Layer

The first three layers of the OSI Reference Model — the physical layer, data link layer, and network layer — are very important layers for understanding how networks function. The physical layer moves bits over wires; the data link layer moves frames on a network; and the network layer moves datagrams on an internetwork.

The transport layer represents an **important transition point between the hardware-associated layers below it** that do the grunt work and the **layers above that are more software-oriented and abstract**.

## TCP (Transmission Control Protocol)

TCP is a full-featured, connection-oriented, reliable transport protocol for TCP/IP applications.

- Provides transport layer addressing that **allows multiple software applications to simultaneously use a single IP** address

- Allows a **pair of devices to establish a virtual connection** and then pass data *bidirectionally*.

- Transmissions are managed using a special sliding window system, with **unacknowledged transmissions detected and automatically retransmitted**.

- Additional functionality allows the flow of data between devices to be managed, and special circumstances to be addressed.

## UDP (User Datagram Protocol)

UDP is a very simple transport protocol that provides transport layer addressing like TCP, but little else. UDP is barely more than a wrapper protocol that provides a way for applications to access IP. **No connection is established, transmissions are unreliable, and data can be lost**.

![transportsummary](/assets/images/transport-comparison.png)

---

## Port Use for Datagram Transmission and Reception

TCP/IP transport layer addressing is accomplished by using TCP and UDP ports. Each port number within a particular IP device identifies a particular software process.

TCP and UDP port numbers are 16 bits in length. Valid port numbers can theoretically take on values from 0 to 65,535.

In theory, it is possible for UDP port number 77 to refer to one application process and TCP port number 77 to refer to an entirely different one. There is no ambiguity, at least to the computers, because **each IP datagram contains a Protocol field that specifies whether it is carrying a TCP message or a UDP message**.

To avoid confusion, by convention, **most reserved port numbers are reserved for both TCP and UDP**. e.g., port 80 is reserved for HTTP for both TCP and UDP, even though HTTP only uses TCP.

![tcpip-multiplex](/assets/images/process-multiplex.png)

### Port Numbers

IANA manages port-number assignments to ensure universal compatibility around the global Internet. The numbers are divided into three ranges: **well-known port numbers (0 to 1023)** used for the most common applications, **registered port numbers (1024 to 49151)** for other applications, and **private/dynamic port numbers (49152 to 65535)** that can be used without IANA registration.

Each time a **client process initiates a UDP or TCP communication, the TCP/IP software assigns it a temporary, or ephemeral, port number** to use for that conversation. The TCP/IP software assigns these port numbers in a pseudo-random way because the exact number that the software uses is not important as long as each process has a different number.

The overall identifier of a TCP/IP application process on a device is **the combination of its IP address and port number**, which is called a **socket**.
    - Notation is <IP Address>:<Port Number>
    - e.g. an HTTP server socket would be `41.199.222.3:80`

### Summary of Port Use

Application process multiplexing and demultiplexing in TCP/IP is implemented using the IP Protocol field and the UDP/TCP Source Port and Destination Port fields.

Upon transmission, the Protocol field is given a number to indicate whether TCP or UDP was used, and the port numbers are filled in to indicate the sending and receiving software process.

The device receiving the datagram uses the Protocol field to determine whether TCP or UDP was used and then passes the data to the software process that the destination port number indicates.

---

## UDP Overview

The User Datagram Protocol (UDP) was developed for use by application protocols that do not require reliability, acknowledgment, or flow control features at the transport layer. It is designed to be simple and fast. It provides only transport layer addressing (in the form of UDP ports), an optional checksum capability, and little else.

### What UDP does

1. **Higher-Layer Data Transfer**: An application sends a message to the UDP software.
2. **UDP Message Encapsulation**: The higher-layer message is encapsulated into the Data field of a UDP message. The headers of the UDP message are filled in, including the Source Port field of the application that sent the data to UDP and the Destination Port field of the intended recipient. The checksum value may also be calculated.
3. **Transfer Message to IP**: The UDP message is passed to IP for transmission.

### What UDP does not do

- Establish connections before sending data. It just packages the data and sends it off.
- Provide acknowledgments to show that data was received.
- Provide any guarantees that its messages will arrive.
- Detect lost messages and retransmit them.
- Ensure that data is received in the same order that it was sent.
- Provide any mechanism to handle congestion or manage the flow of data between devices.

**Similar limitations to IP**. UDP is basically IP with transport layer port addressing. (For this reason, UDP is sometimes called a **wrapper protocol**, since all it does is wrap application data in its simple message format and send it to IP.)

### UDP Message Format

![udp-message](/assets/images/udp-messageformat.png)

- **UDP header is only 8 bytes in length** (compared to TCP of 20 bytes or more)

### When to use UDP over TCP

- A protocol uses UDP instead of TCP in two situations:
    - 1) when an application values timely delivery over reliable delivery, and when TCP’s retransmission of lost data would be of limited or even no value.
    - 2) when a simple protocol can handle the potential loss of an IP datagram itself at the application layer using a timer/retransmit strategy, and when the other features of TCP are not required.

**Applications that require multicast or broadcast transmissions** also use UDP, because TCP does not support those transmissions.


