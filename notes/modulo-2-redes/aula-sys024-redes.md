# Aula 024 - Redes - Layer 3 Network, Routing, IPv4 and ICMP

## Layer 3 - Network

The network layer is primarly concerned with the delivery between devices that may be on different networks, interconnected in an arbitrary manner i.e. an internetwork.

In this layer, the protocol unit is the **packet**.

## Routers - Layer 3 Devices

The network interconnection devices that operate at the network layer are usually called **routers**. They are responsible for the routing functions because they receive packets as they are sent along each “hop” of a route and send them on the next leg of their trip. They communicate with each other using routing protocols in order to determine the best routes for sending traffic efficiently.

### Routing Protocols

[Link](https://en.wikipedia.org/wiki/Routing)

With **static routing**, small networks may use manually configured routing tables. Larger networks have complex topologies that can change rapidly, making the manual construction of routing tables unfeasible.

**Dynamic routing** attempts to solve this problem by constructing routing tables automatically, based on information carried by routing protocols, allowing the network to act nearly autonomously in avoiding network failures and blockages. Dynamic routing dominates the Internet.

Examples of dynamic-routing protocols and algorithms include Routing Information Protocol (RIP), Open Shortest Path First (OSPF) and Enhanced Interior Gateway Routing Protocol (EIGRP).

Differentiation of routing protocols is on basis of the algorithms and metrics they use.

**Algorithm** is a method that the protocol uses for determining the best route between any pair of networks, and for sharing routing information between routers.

**Metric** is a measure of "cost" that is used to asses the efficiency of a particular route.
#### Most common Routing Algorithms

- **Minimal**: the router only knows its neighbours and doesn't have a routing table, **"Flooding"**
    - Every incoming packet is sent through every outgoing link except the one it arrived on.
    - Used in bridging and in systems such as Usenet and peer-to-peer file sharing and as part of some routing protocols, including OSPF, DVMRP, and those used in ad-hoc wireless networks (WANETs)
    - **Selective flooding**, a variant that partially addresses these issues by only sending packets to routers in the same direction. Routers don't send every incoming packet on every line but only on those lines which are going approximately in the right direction.

![flooding](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Flooding_routing.gif/440px-Flooding_routing.gif)

- **Decentralized**: Routers knows its neighbours AND the cost to get to each one of them. By exchanging information with its neighbours, it can build a routing table, **"Distance vector algorithms"**
    - Distance metric is the number of hops, or routers, between networks
    - Routers regularly send their routing table to each router they immediately connect with (their neighbors or peers)

- **Global**: Routers know the entirety of the network topology and use that information to build a routing table, **"Link State Algorithms" or "Shortest-Path First"**
    - Each router maintains a map describing the current network topology
    - Each map is updated regularly by testing reachability with other routers
    - A variety of metrics can be used to indicate the true cost of sending a datagram over a particular route
    - Allow routs to be selected on more realistic metrics of cost than simply the number of hops

[Dijkstra's Shortest Path Algorithm](https://www.youtube.com/watch?v=GazC3A4OQTE)

## Internet Protocol (IP)

The main protocol at the network layer is the Internet Protocol (IP).

As a layer 3 protocol it provides a service to layer 4 "Transport", represented mainly by the Transmission Control Protocol (TCP) and User Datagram Protocol (UDP).

### Main Characteristics

- **Universally Addressed**:
    - IP defines the addressing mechanism for the network and **uses these addresses for delivery purposes**.

- **Underlying Protocol-Independent**:
    - Designed to **allow transmission of data across any type of underlying network** that works with the TCP/IP stack, including Ethernet, 802.11 or even special data link protocols like SLIP and PPP.

- **Connectionless Delivery**:
    - When point A wants to send data to point B, **it doesn't first set up a connection** to point B and then send the data - it just makes the datagram and sends it.

- **Unreliable Delivery**:
    - IP doesn't keep track of the datagrams sent from point A to B, it just sends them.
    - It does not provide reliability, error protection, flow control or retransmission of lost datagrams.
    - Sometimes called a "**best-effort protocol**".

- **Unacknowledged Delivery**:
    - Doesn't use ACK messages when datagrams are received.

### IP Functions

- **Addressing**:
    - Before it can deliver datagrams, IP must know where to deliver them
    - Includes a mechanism for host addressing
    - Allows for unique addressing across arbitrarily large networks
    - Contains a structure to facilitate the routing of datagrams to distant networks

- **Data Encapsulation and Formatting/Packaging**:
    - IP accepts data from the transport layer protocols UDP and TCP
    - It then encapsulates this data into an IP datagram using a special format prior to transmission

- **Fragmentation and Reassembly**:
    - Datagrams are passed down to the data link layer for transmission on the local network
    - Maximum frame size of each physical and data link network maybe different so **IP can fragment datagrams into pieces**
    - Receiving devices uses a reassembly function to re-create the whole IP datagram

- **Routing and Indirect Delivery**:
    - IP datagrams sent on the same local network you can do this with the network's underlying LAN, WLAN or WAN protocols (direct delivery)
    - Datagrams being sent to a distant network must be delivered indirectly
    - Possible via routing through intermediate devices (routers)
    - IP accomplishes this with support from protocols like ICMP, RIP and BGP

### Other IP-Related Protocols

- NAT (Network Address Translation):
    - Allow private networks to be interfaced to public networks

- IPsec (IP Security):
    - Defines a set of subprotocols that provide a mechanism for secure transfer of data using IP
    - Enables virtual private networks (VPN)

- Mobile IP
    - Allows data to be automatically routed to a mobile host (such as a notebook computer) without requiring a constant reconfiguration of the device's IP address

### IP Addressing Overview

Any device will have at least one IP address: one PER network interface.

![ipinterfaces](/assets/images/ipinterfaces.png)

- Network segments connected by switches form a **single broadcast domain**, and any devices on them can send data to each other directly without routing.

- **Address Uniqueness and Network Specificity:** If devices move to a new network, the IP address will usually have to change as well.

- **ARP (Address Resolution Protocol)** creates a map between IP and data link layer addresses (MAC addr)

- Two ways of setting up IP addresses:
    - On a **private network** a single organization controls address assignment, they can select numbers as long as each address is unique
    - On a **public network** a mechanism is required to ensure organizations don't use overlapping addresses and use efficient routing of data.
    - Best example is the **Internet** where **public IP registration** and management facilities have been created
    - Techniques like NAT allow for connection between private and public TCP/IP networks.

- Addressing Types:
    - **Static addresses**: each device is manually configured with an IP address that doesn't change
    - **Dynamic addresses**: addresses are assigned to devices and changed under software control
    - **BOOTP and DHCP** are the two most popular host configuration protocols for dynamic addressing

### IPv4 Addressing

- An IPv4 address is a 32-digit binary number, split into 4 octets (4 bytes each) and converted to a decimal number. Each octet is separated by a period: "dotted decimal notation"

![ipaddr-binary](/assets/images/ipaddress-binary.png)

- Since the IP address is 32 bits wide, this provides a theoritical **address space** of 2^32 or 4,294,967,296 addresses.

- Due to how IP addresses are allocated, not every one of those addresses can actually be used.
    - e.g. all addresses starting with 127 are allocated to the loopback function

- **Network Identifier (Network ID)** - starting from the left-most bit, a certain number of bits can be used to identify the network where the host or network interface is located (also called the *network prefix*)

- **Host Identifier (Host ID)** - the remainder of bits is used to identify the host on the network

![ipaddr-division](/assets/images/ipaddr-division.png)

![ipv4-division](/assets/images/ipv4-division.png)

### IPv4 Addressing Categories

Different systems of indicating where in the IP address the host ID is found.

- **Conventional (Classful) Addressing**
    - Three main classes of addresses - A, B and C, designated for conventional unicast addresses and taking up seven-eighths of the address space.
    - Class D is reserved for IP multicasting, and Class E is reserved for experimental use.
    - Dividing line between bits occurs only on octet boundaries
    - e.g., class C addresses devote 24 bits to the network and 8 bits to the host ID

![ip-classful](/assets/images/ip-classful.png)

![ip-bitassignments](/assets/images/ip-classfulassignments.png)

![ip-patterns](/assets/images/ip-patterns.png)

![ip-reserved](/assets/images/ip-reserved.png)

[Video](https://youtu.be/Q3wYfb3jnE8?list=PLG49S3nxzAnlCJiCrOYuRYb6cne864a7G)

- **Subnetted Classful Addressing** (superceded by Classless Addressing)
    - Take some number of bits from a class A, B or C host ID and use them for a **subnet identifier (subnet ID)**
    - Subnet ID is used for routing with different subnetworks inside a complete network
    - e.g., class C normally uses first 24 bits for network ID and 8 bits for host ID. The host ID can be split into 3 bits for subnet ID and 5 bits for host ID
    - Dividing line between subnet ID and "subhost" ID is indicated by a 32-bit number called a **subnet mask**.
    - e.g., for previous class C example, subnet mask would be 27 ones and 5 zeros - zeros indicate the host. In dotted decimal notation, 255.255.255.224

- **Classless Addressing**
    - Classes no longer exist and division between network ID and host ID can occur at any arbitrary point, not just on octet boundaries
    - Dividing point is indicated by putting the number of bits used for the network ID (prefix length) AFTER the address
    - e.g. if 227.82.157.177 is part of a network where the first 27 bits are used for the network ID, then the classless addressing is 227.82.157.160/27
    - /27 is the same as 255.255.255.224 subnet mask, since it has 27 one bits followed by 5 zeros.

#### CIDR Notation

![cidr-notation](/assets/images/cidr-notation.png)

#### Subnetting

[Video 1](https://youtu.be/7AGp1glJm8M?list=PLG49S3nxzAnlCJiCrOYuRYb6cne864a7G)
[Video 2](https://youtu.be/4kMGs9-HDEk?list=PLG49S3nxzAnlCJiCrOYuRYb6cne864a7G)
[Video 3](https://youtu.be/XMzLpGKTu50?list=PLG49S3nxzAnlCJiCrOYuRYb6cne864a7G)

![subnetmask-calc](/assets/images/subnetmask-calc.png)

### Supernetting

Under CIDR, you have many hierarchical levels: You split big blocks into smaller blocks, and then still-smaller blocks, and so on. It makes sense to manage blocks in a similar hierarchical manner as well. So what happens is that IANA/ ICANN divides addresses into large blocks, which it distributes to the four regional Internet registries (RIRs): APNIC, ARIN, LACNIC, and RIPE NCC. These then further divide the address blocks and distribute them to lower-level national Internet registries (NIRs), local Internet registries (LIRs), and/or individual organizations such as Internet service providers (ISPs)

![supernetting](/assets/images/supernetting.png)

### Default Gateway
- Often specified along with the IP address for a device
- It is the IP address of the router that provides default routing function for a particular device
- When a device wants to send a datagram to a device it can't see on its local network, it sends it to the default gateway, which takes cares of the routing functions.

### Multihoming

- If a device has more than one interface to the internetwork, it will have more than one IP address. e.g. Routers, which connect together different networks and must have an IP address for the interface on each one

- It also possible for hosts to have more than one address, called **multihoming**

- **Two or more interfaces to the *same* network**: servers or workstations with two physical interfaces to the same network for performance and reliability. They will have two IP addresses on the same network.

- **Interfaces to two or more *different* networks**: devices have multiple interfaces to different networks. IP addresses will have different network IDs in them.
    - A host connected to two networks can be configred to function as a router via software

- Special cases like a host with a single network connection having multiple IP address aliases are still possible.

- When subnetting is used, the same distinction can be made between multihoming to the same subnet or a different subnet.

## ICMP (Internet Control Message Protocol)

Originally created to allow the reporting of a small set of error conditions, ICMP messages are now used to implement a winde range of error-reporting, feedback, and testing capabilities.

IP devices also often need to share specific information in order to guide them in their operation, and they need to perform tests and diagnostics. However, IP itself includes no provision that allows devices to exchange low-level control messages. Instead, these features are provided in the form of a companion protocol to IP called the Internet Control Message Protocol (ICMP).

ICMP error-reporting messages sent in response to a problem seen in an IP datagram can be sent back only to the originating device. **Intermediate devices cannot be the recipients of an ICMP message** because their addresses are normally not carried in the IP datagram’s header.

ICMP messages are divided into two general categories: **error messages** that are used to report problem conditions, and **informational messages** that are used for diagnostics, testing, and other purposes.

A total of 256 different possible message types can be defined for each of ICMPv4 and ICMPv6. The Type field that appears in the header of each message specifies the kind of ICMP message.
    - In ICMPv4, there is no relationship between Type value and message type.
    - In ICMPv6, **error messages have a Type value of 0 to 127**, and **informational messages have a Type value of 128 to 255**.

![icmpmessages](/assets/images/icmpmessages.png)