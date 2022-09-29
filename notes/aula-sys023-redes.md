# Aula 023 - Redes - Layer 2 devices, VLANs, Spanning Tree Protocol

## Protocol Stack

![stack](/assets/images/protocolstack.png)

## Layer 2 Devices

[Video - Hub, Switch or Router?](https://www.youtube.com/watch?v=1z0ULvg_pW8)

Many types of hardware are associated with the data link layer. **Network interface cards** typically implement a specific data link layer technology, so they are often called **Ethernet cards**, Token Ring cards, and so on.

There are also a number of network interconnection devices that are said to operate at layer 2 in whole or in part because they make decisions about what to do with data they receive by looking at data link layer frames. These devices include most **bridges, switches, and brouters**, though the latter two also encompass functions performed by layer 3.

Some of the most popular technologies and protocols generally associated with layer 2 are Ethernet, Token Ring, FDDI (plus CDDI), HomePNA, IEEE 802.11, Asynchronous Transfer Mode (ATM), TCP/IP’s Serial Line Interface Protocol (SLIP), and TCP/IP’s Point-to-Point Protocol (PPP).

### Switches

A switch (comutador Ethernet in Portuguese) is a layer 2 device.

- **Selective Forwarding** based on the destination address specified in the frame header
    - Keeps a MAC address table and re-transmits only to the destination port
    - Broadcasts only if it doesn't have the destination address in the MAC address table
- **Transparent**: hosts don't detect the presence of switches
- **Plug-and-play, self-learning**: doesn't need configuration
- **Auto-detection**: adapt to different standards like 100BASET, 1000BASET, 100BASEFX, 10BASEX (legacy segments), etc.
- Can **receive multiple frames simultaneously** thanks to a port buffer
    - It can also **retransmit** multiple frames simultaneously
- No collisions at the station level, **CSMA/CD is implemented at the switch level**
- Supports **different communication modes**: simplex/half-duplex/full-duplex
- Supports **Spanning Tree protocol** implementation
- **Different switching modes**:
    - **Store-and-Forward** (frame buffer - guarantees NO collision and NO errors)
    - **Cut-through** (forwards frame before the whole frame has been received, after destination address data has been received)
    - **Modified Cut-through** (forwards frame before the whole frame has been received, after receiving 64 bytes of data  - guarantees NO COLLISION)

## VLAN

VLANs allow a single extended LAN to be partitioned into several seemingly separate LANs.

Each virtual LAN is assigned an identifier (sometimes called a color), and **packets can only travel from one segment to another if both segments have the same identifier**.

This has the effect of limiting the number of segments in an extended LAN that will receive any given broadcast packet.

VLANs can be based on:

- Ports: switch ports are configured on the switch's software to appear as a single physical switch
    - Each port is assigned a VLAN ID
    - Frames are only forwarded if both ports belong to the same VLAN
    - Broadcast frames are only broadcast inside the VLAN
- IPs
- MAC Addressess

### Trunk Access

- Transports multiple VLANs
- Used to interconnect switches
- Frames are tagged with a VLAN ID

![trunkports](https://imgs.search.brave.com/e97agPKipo539VDaSfzPMYr6eh2-gsHDiKhg-YQxa-g/rs:fit:631:236:1/g:ce/aHR0cDovL25ldHp3/ZWIud2VlYmx5LmNv/bS91cGxvYWRzLzUv/Ny8xLzcvNTcxNzMy/NDUvdmxhbnMtdnRw/ZnJhbWUucG5nPzYz/Mw)

[Video - Trunk and Access Ports](https://youtu.be/JCb5RW4JKlQ)

## Spanning Tree Algorithm (IEEE 802.1D)

Protocol which enables networks bridges to locate loops in a local area network.

**Bridge = switch**

[Link](https://en.wikipedia.org/wiki/Spanning_Tree_Protocol)

[Link 2](https://www.ciscopress.com/articles/article.asp?p=2832407&seqNum=4)

Building and expanding bridged networks was difficult because loops, where more than one path leads to the same destination, could result in the collapse of the network. Redundant paths in the network meant that a bridge could forward a frame in multiple directions. Therefore loops could cause Ethernet frames to fail to reach their destination, thus flooding the network.

[Video 1](https://www.youtube.com/watch?v=mLCpdsOZM9c)

[Video 2](https://www.youtube.com/watch?v=japdEY1UKe4)

### STP Protocol Summary

1. Elect a **Root Bridge** with the lowest **Bridge ID**
2. Set all Root Bridge's ports in FWD state and turn them into **Designated Ports**
3. Each remaining switch will select ONE of its interfaces to be a **Root Port (RP)** and set it to FWD state
    - The ports connected to another switch's root port MUST be designated. Because the root port is the switch's path to the root bridge, another switch must not block it
4. Remaining switches will select ONE interface to be a **Designated Port** which will be in FWD state. All other ports are put in **BLK state**

All switches constantly communicate with their neighbors using **bridge protocol data units (BPDUs)**

### Port Roles

- **Root Ports**: the best port to reach the Root Bridge (lower cost/highest bandwidth)
- **Designated Port**: port with the best route to the Root Bridge on a link.
- **Non-Designated Port**: all other ports that are in a blocking state

### Port States

- **Blocking**: no user data is sent or received. BPDU data is still received.
- **Listening** (transitional state): network switch processes BPDUs and awaits new information that could make it return to blocking state. It does not populate the MAC table or forward frames.
- **Learning** (transitional state): before it can forward frames, it learns source addresses from received frames and adds them to the MAC table.
- **Forwarding**: normal operation receiving and forwarding frames. Monitors BPDUs that'd indicate it should return to blocking state to prevent a loop.
- **Disabled**: network admin has manually disabled port.

### Root Bridge Election

- The one with lowest Bridge ID
- **Bridge ID** is the concatenation of the bridge priority and the MAC address
- **Priority default is 32768** (plus the VLAN number) and can only be configured in **multiples of 4096**
- Priority portions are compared first and the MAC addresses are compared only if priorities are equal

### Root Ports Selection

Root Ports are elected based on the port cost. The cost is the collection of **each outgoing port to the root**.

In 2004, the revised 802.1D had its 16-bit path cost increased to a 32-bit value, providing more granularity:

Port Speed | Original | Revised IEEE 802.1D-1998
--- | --- | ---
10 Mbps | 100 | 2,000,000
100 Mbps | 19 | 200,000
1 Gbps | 4 | 20,000
10 Gbps | 2 | 2,000
100 Gbps | N/A | 200
1 Tbps | N/A | 20

If there is a tie in root cost, the switch will select the interface connected to the **neighbor with the lowest bridge ID.**

If bridge IDs between neighbors are equal, then the interface connected to the interface on the **neighbor switch with lowest port ID** will become root port.

### Designated Port Selection

1. Interface on switch with lowest root cost
2. Interface on switch with lowest bridge ID

Other interfaces will become non-designated ports, in a blocking state.

![spanningtree](https://dbgate.files.wordpress.com/2016/01/stptopologija1.jpg)

---

## Videos:

[How to configure STP](https://www.youtube.com/watch?v=mxCPdB7aWtY)

[STP packet simulation in Packet Tracer](https://www.youtube.com/watch?v=NbY4vxIEv0U)


