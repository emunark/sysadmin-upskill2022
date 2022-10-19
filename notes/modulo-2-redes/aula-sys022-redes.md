# Aula 022 - Redes - Layer 2 Data Link Layer

## Layer 2 - Data Link (Ligação de Dados)

[Link](https://paginas.fe.up.pt/~jruela/redes/teoricas/Data_link_v0809_mieec.pdf)

### Main characteristics

- Data Link layer transports **frames** between network nodes;

- **Uses services of the physical layer** below it to send and receive bits over (possibly unreliable) communication channels that may lose data;

- **Provides** a well-defined **service interface to the network layer**;

### Main functions

- Frame synchronization / delineation: **Framing** sequences of bytes as self-contained **segments**;

- **Data Link management**: establishment, maintenance and termination of data link connections;

- **Addressing**: identification of physical and logical entities;

- **Error Control**: Detection and correction of transmission errors;

- **Flow Control**: Regulating the flow of data so that slow receivers are not swamped by fast senders;

- **Transparency** (code independency);

- **Recovery** from protocol errors.

Other functions of the data link layer:

- MAC filtering
- Spanning Tree
- QoS
- VLANs
- Logical Topology
- ACK of received messages
- Multiplexing (logical link)

---

## Sublayers - MAC and LLC

Between the Physical and Data Link layers, there are **Medium Access Control (MAC)** and **Logical Link Control (LLC)** sublayers.

[Link](https://www.ciscopress.com/articles/article.asp?p=2092245&seqNum=2)

![sublayers](https://www.tutorialspoint.com/assets/questions/media/25564/application_process.jpg)

*MAC Sublayer:*

- Transitions down to the Physical layer;
- Responsible for **encapsulating frames** so they are suitable for transmission via physical medium;
- Defines unique MAC addresses as form of identification for all devices in an Ethernet network.

*LLC Sublayer:*

- Transitions up to the Network layer;
- Sits on top of all 802.x protocols [1];
- Primary function is to **multiplex protocols over the MAC layer** while transmitting and likewise to de-multiplex the protocols while receiving;

An LLC header tells the data link layer what to do with a packet when it receives a frame. For example, a host receives a frame and then looks in the LLC header to understand that the packet is destined for the IP protocol at the network layer.

[1] IEEE 802.x protocols - [More info](https://en.wikipedia.org/wiki/IEEE_802)

![ieee802](https://ptgmedia.pearsoncmg.com/images/chap3_9781587143762/elementLinks/03fig04_alt.jpg)

---

## Evolution of Ethernet Protocols

[Link](https://en.wikipedia.org/wiki/Ethernet#Evolution)

The IEEE 802.3 Frame Format vs. classic Ethernet frame

![frameformat](https://ptgmedia.pearsoncmg.com/images/chap3_9781587143762/elementLinks/03fig06_alt.jpg)

Original the Ethernet header did not use an LLC header. Instead, it used a type field in the Ethernet header to identify the Layer 3 protocol being carried in the Ethernet frame.

### Original Ethernet

![ogethernet](https://upload.wikimedia.org/wikipedia/commons/9/9e/Bustopologie.png)

The original Ethernet implementation: shared medium, collision-prone.

All computers trying to communicate share the same cable, and so compete with each other.
    - Uses a Hub (concentrador) based on the Physical layer (L1)
    - A station transmits and all other stations receive the same signal (repetition)

Original Ethernet's shared coaxial cable (the shared medium) traversed a building or campus to every attached machine. A scheme known as **carrier-sense multiple access with collision detection (CSMA/CD)** governed the way the computers shared the channel.

A collision happens when two stations attempt to transmit at the same time. They corrupt transmitted data and require stations to re-transmit. The lost data and re-transmission reduces throughput.

### Modern Ethernet - Switched Ethernet

![modernethernet](https://upload.wikimedia.org/wikipedia/commons/c/c7/HUB_SWITCH_6.jpg)

Modern Ethernet implementation: switched connection, collision-free.

Each computer communicates only with its own switch, without competition for the cable with others.
    - Uses a Switch (comutador) based on the Data Link layer (L2)
    - Requires frame header processing (source and destination MAC addresses) and expedition tables

In this topology, collisions are only possible if station and switch attempt to communicate with each other at the same time, and collisions are limited to this link.

The 10BASE-T standard introduced **full duplex** (common with Fast Ethernet and the de facto standard w/ Gigabit Ethernet).

- In full duplex, switch and station can send and receive simultaneously, and therefore modern Ethernets are completely collision-free.
    - There are no collisions but there are queues which can originate **overflows**.

### Fast Ethernet (IEEE 802.3u)

- Same frame structure as 802.3
- Most common 100BASE-TX
- "100" refers to the transmission speeds of 100Mbit/s
- "BASE" refers to baseband signaling.
- The letter following the dash ("T" or "F") refers to the physical medium that carries the signal (twisted pair or fiber, respectively);
- Last character ("X", "4", etc.) refers to the line code method used.

### Gigabit Ethernet (IEEE 802.3z)

- Same frame structure as 802.3
- Most common 1000BASE-T (IEEE 802.3ab): UTP category 5, 5e or 6 cabling
- Speeds up to 1000Mbit/s

Deprecated protocols:
- **10BASE5 (802.3)** or Thicknet
- **10BASE2 (802.3a)** or Thinnet (easier installation and less costly)
- **10BASE-T (802.3i)**

[Different types of Ethernet Cables](https://www.youtube.com/watch?v=_NX99ad2FUA)

---

## CSMA/CD - Medium Access Control Protocol

[Video](https://www.youtube.com/watch?v=iKn0GzF5-IU)

- Designed for 802.3 Ethernet

- Stations on a CSMA/CD LAN can access the network at any time.

- Before sending data, CSMA/CD stations listen to the network to determine whether it is already in use.
    - If it is, the CSMA/CD stations wait.
    - If the network is not in use, the stations transmit.

- A collision occurs when two stations listen for network traffic, hear none, and transmit simultaneously.
    - Both transmissions are damaged, and the stations must retransmit at some later time.

- CSMA/CD stations must be able to detect collisions to know that they must retransmit.

Types of CSMA:

1. **1-persistent**: if busy, transmits as soon as it's free

2. **Nonpersistent**: if busy, waits a random amount of time for retransmission attempt

3. **p-persistent**: transmits at a free slot with *p* probability, if it doesn't transmit then it repeats the process until transmission is complete or another station gains channel access, at which point a random time for retransmission is generated.

### Binary Exponential Back-off

Collision resolution mechanism used in random access MAC protocols (CSMA/CD).

Exponential backoff algorithms can be **used to avoid network collisions**.

In a point-to-multipoint or multiplexed network, multiple senders communicate over a single shared channel. If two senders attempt to transmit a message at the same time, or "talk over" each other, a collision occurs and the messages are damaged or lost. Each sender can then back off before attempting to retransmit the same message again.

This algorithm is generally used in Ethernet to schedule re-transmissions after collisions.

If a collision takes place between 2 stations, they may restart transmission as soon as they can after the collision. This will always lead to another collision and form an infinite loop of collisions leading to a deadlock. To prevent such scenario back-off algorithm is used.

---

## Ethernet Frame Size

Each frame contains up to 1500 bytes of data.

Minimally, a frame must contain at least 46 bytes of data, even if this means the host has to pad the frame before transmitting it. The reason for this minimum frame size is that the **frame must be long enough to detect a collision**.

---

## Framing

Frame synchronization or delineation (or simply **framing**) is the process of defining and locating frame boundaries (start and end of the frame) on a bit sequence.

### Need for framing

- Data communications is based on the exchange of data units with a known structure
    - In general, frames are of variable length (up to a predefined max)

- This structure **must be recognized by the receiver out of a sequence of raw bits**, which requires identifying the frame boundaries

### Types of frame delineation (Variable-size framing)

#### **Byte/Character oriented**

![byteframing](http://www.myreadingroom.co.in/images/stories/docs/dcn/framing_character%20oriented%20Protocol.JPG)

- Frame is made of a sequence of characters
- Special characters (e.g. ASCII code) are used to indicate the beginning and the end of a frame
- Good for exchanging text messages but other types of information (audio, video, etc.) can carry character patterns the same as the special characters used for delineation
- An ASCII character fits one byte (octet) hence the byte oriented counting
- Byte stuffing: add 1 extra byte whenever there is a flag or escape character in the text

![bytestuffing](http://www.myreadingroom.co.in/images/stories/docs/dcn/framing_character%20oriented%20ProtocolByte%20stuffing.JPG)

#### **Bit oriented**

![bitframing](http://www.myreadingroom.co.in/images/stories/docs/dcn/framing_Bit%20oriented%20Protocol.JPG)

- Frame is a sequence of bits
- Special bit-pattern (e.g. 01111110) at the beginning and the end of the frame
- Data is a codified representation of information (text, audio, video, etc)
- The other fields are interpreted according to protocol-defined rules
- Bit stuffing: add one extra 0 whenever five consecutive 1's follow a zero in the data, so receiver does not mistake it for a flag

![bitstuffing](http://www.myreadingroom.co.in/images/stories/docs/dcn/framing_Bit%20oriented%20Protocolbit%20stuffing.JPG)

---

## Error Detection and Control

Received frames may differ from transmitted ones due to a variety of reasons

- Error detection mechanisms cope with these situations and is expected they will catch most of these errors

- Some errors may not be detected, erroneous frames are accepted for processing at the Data Link layer
    - Can be detected at the Data Link Layer, at a higher layer or remain undetected

- Tranmission errors can occur in a random way and are independent (**single bit errors**) or in **bursts**, affecting close by bits

- Error Detecting Codes:
    - [Hamming Code](https://www.youtube.com/watch?v=X8jsijhllIA&t=596s) - allows for error correction > correct with FEC
    - [Cyclic Redundancy Code (CRC)](https://www.youtube.com/watch?v=iwj8ZgyzqZk) - allows only for code detection > correct with ARQ

### Error Correction

- **Forward Error Correction (FEC)**
    - **Receiver corrects errors** based on redundant information received

- **Automatic Repeat Request (ARQ)**
    - **Transmitter corrects errors** by automatic re-transmission

### Types of ARQ

- **Stop&Wait**
    - After transmitting a frame the sender must wait for a positive acknowledgment (ACK) from the receiver before sending a new one
    - The receiver must reply with ACK after receiving and accepting a valid frame
    - After receiving ACK, the sender is allowed to transmit a new frame

Example of error-free operation:

![stopnwait](/assets/images/stopnwait.png)

Example of transmission error:

(Lost frame or ACK)
![stopnwaiterror](/assets/images/stopnwait-error.png)

(Delayed ACK and lost frame)
![stopnwaitdelay](/assets/images/stopnwait-delay.png)

![stopnwaitexample](/assets/images/stopnwait-example.png)

- **Sliding Window**
    - Sender is allowed to transmit multiple frames before receiving ACKs for other previously sent frames
    - The number of frames in queue (waiting for ACK) is equal to the size of the window in use (agreed between sender and receiver)
    - Consecutive frames may be acknowledged in blocks
    - Window size is updated every time frames in queue are acknowledged

![windowrotation](/assets/images/windowrotation.png)


### Types of Sliding Window

- **Go-Back-N (GB-n)**

    - Re-transmits all the frames
    - Only accepts in-sequences frames
    - If receiver detects an out of sequence frame, a recovery action is initiated
    - Receiver sends a Reject (REJ) S-frame with a sequence number that indicates to sender where to start retransmission (simultaneously acknowledging any frames in queue)
    - When the sender receives a REJ frame, it goes back and starts to retransmit all frames from the one indicated by sequence number

![gobackn](/assets/images/gobackn.png)

[Video Demonstration](https://youtu.be/QD3oCelHJ20)

- **Selective Repeat**
    - Re-transmits only that frame which is damaged
    - Receiver accepts out of sequences frames
    - Retransmission of frames marked as Selective Reject (SREJ)
    - Receiver only acknowledges blocks of consecutive frames and has to wait for missing frames

![selectiverepeat](/assets/images/selectiverepeat.png)

[Video Demonstration](https://youtu.be/WfIhQ3o2xow)

- **Piggyback Acknowledgment**
    - Sends messages and ACK signals at the same time