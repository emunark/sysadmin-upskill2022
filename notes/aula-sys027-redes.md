# Aula 027 - Redes - Address Resolution between Layer 2 and 3, ARP

## Address Resolution

Communication on an internetwork is accomplished by sending data at layer 3 using a network layer address, but **the actual transmission of that data occurs at layer 2** using a data link layer address.

This means that every device with a fully specified networking protocol stack will **have both a layer 2 and a layer 3 address**. It is necessary to define some way of being able to link these addresses together.

Usually, this is done by taking a network layer address and determining what data link layer address goes with it. This process is called **address resolution**.

Consider the OSI model:

- The data link layer and the network layer deal with addressing.
- The physical layer is not strictly concerned with addressing at all, but rather, only with sending at the bit level.
- The layers above the network layer all work with network layer addresses.

**But why is addressing done at two different layers?**

- The layer 2 addresses (such as IEEE 802 MAC addresses) are used for local transmissions between hardware devices that can communicate directly. Implement basic local area network (LAN), wireless LAN (WLAN), and wide area network (WAN) technologies.
- In contrast, layer 3 addresses (most commonly, IP addresses) are used in internetworking to create the equivalent of a massive virtual network at the network layer.

![address-resolution](/assets/images/address-resolution.png)

## ARP - Address Resolution Protocol

ARP was developed to facilitate **dynamic address resolution between IP and Ethernet** and can now be used on other layer 2 technologies as well. It works by allowing an IP device to send a broadcast on the local network, and it requests a response with a hardware address from another device on the same local network.

![arp-protocol](/assets/images/arp-protocol.png)

The source device broadcasts an ARP Request that’s looking for a particular device based on the device’s IP address. That device responds with its hardware address in an ARP Reply message.

### Routers and ARP

- When routers receive ARP requests from one network for hosts on the other network, they will respond with an ARP reply packet with their MAC address.

- PC1 is in one network, PC2 is in another network and the router connects these two networks.

- When PC1 sends an ARP request to resolve the MAC address of PC2, the router receives this packet.

- The router sends an ARP reply with its MAC address.

- After ARP, PC1 will send all the packets destined for PC2 to the router.

NOTE: Both the routers and PCs keep an ARP table

## Address Resolution in IPv6

Address resolution in IPv6 **uses the new Neighbor Discovery (ND) Protocol** instead of the Address Resolution Protocol (ARP).

A device trying to send an IPv6 datagram sends a Neighbor Solicitation message to get the address of another device, which responds with a Neighbor Advertisement. When possible, to improve efficiency, the request is sent using a special type of multicast address rather than broadcast.

**NOTE** ND really isn’t a layer connection or lower-level protocol like ARP. It is analogous to ICMP in its role and function, and, in fact, makes use of ICMP(v6) messages. One advantage of this architectural change is that there is less dependence on the characteristics of the physical network, so resolution is accomplished in a way that’s more similar to other network support activities. Thus, it is possible to make use of facilities that can be applied to all IP datagram transmissions, such as IP security features.



