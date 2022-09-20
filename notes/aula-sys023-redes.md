# Aula 023 - Redes

## Protocol Stack

![stack](https://www.w3.org/People/Frystyk/thesis/tcp.gif)

## Hub, Switch or Router?

[Video](https://www.youtube.com/watch?v=1z0ULvg_pW8)

## VLAN - Trunk and Access Ports

VLANs allow a single extended LAN to be partitioned into several seemingly separate LANs.

Each virtual LAN is assigned an identifier (sometimes called a color), and **packets can only travel from one segment to another if both segments have the same identifier**.

This has the effect of limiting the number of segments in an extended LAN that will receive any given broadcast packet.

[Video](https://youtu.be/JCb5RW4JKlQ)

## Spanning Tree Algorithm (IEEE 802.1D)

Protocol which enables networks bridges to locate loops in a local area network.

**Bridge = switch**

[Link](https://en.wikipedia.org/wiki/Spanning_Tree_Protocol)

[Video 1](https://www.youtube.com/watch?v=mLCpdsOZM9c)

Building and expanding bridged networks was difficult because loops, where more than one path leads to the same destination, could result in the collapse of the network. Redundant paths in the network meant that a bridge could forward a frame in multiple directions. Therefore loops could cause Ethernet frames to fail to reach their destination, thus flooding the network.

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

Port Speed | Original | New
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


