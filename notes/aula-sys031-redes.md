# Aula 031 - Redes - IPv6, ND Protocol, SLAAC

## IPv6 Addresses

[Video](https://youtu.be/irhS0ASkvy8)

The new version of IP, Internet Protocol version 6, was created to correct some of the significant problems of IPv4, especially the looming deficiency of the IPv4 address space, to improve the operation of the protocol as a whole, and to take TCP/IP into the future.

- **Larger Address Space**
    - IPv6 addresses are 128 bits long instead of 32 bits (1028 times larger than IPv4).
    - Expands address space from around 4 billion addresses to over 300 trillion trillion trillion addresses.

- **Hierarchical Address Space**
    - Address size was expanded so much to allow it to be hierarchically divided to provide a large number of many classes of addresses.

- **Hierarchical Assignment of Unicast Addresses**
    - A special global unicast address format was created to allow addresses to be easily allocated across the entire Internet
    - Multiple levels of network and subnetwork hierarchies at both ISP and organizational level
    - Permits generation of IP addresses based on underlying hardware interface device IDs like MAC addresses

- **Better Support for Nonunicast Addressing**
    - Support for multicasting is improvated
    - Support for a new type of addressing, **Anycast addressing**
    - Anycast delivers datagrams to the easiest-to-reach member of a group

- **Autoconfiguration and Renumbering**
    - Easier autoconfiguration of hosts and renumbering of the IP addresses in networks and subnetworks.
    - A technique also exists for renumbering router addresses

- **New Datagram Format**
    - The main header of each IP datagram has been streamlined, and support has been added for the ability to easily extend the header for datagrams that require more control information.

- **Support for Quality of Service (QoS)**
    - IPv6 datagrams include QoS features that allow for better support for multimedia and other applications that require QoS

- **Security Support**
    - Designed into IPv6 using the authentication and encryption extension headers and other features.

- **Updated Fragmentation and Reassembly Procedures**
    - Fragmentation and reassembly of datagrams has been changed in IPv6
    - Improved routing efficiency

- **Transition Capabilities**
    - A plan for interoperating IPv4 and IPv6 networks, mapping between IPv4 and IPv6 addresses, has been provided

- **Changes to Other Protocols**
    - Several other TCP/IP protocols have been updated with the introduction of IPv6
    - ICMP has been revised through the creation of ICMPv6 for IPv6.
    - A new protocol called ND protocol, performs serveral functions that were done by ARP and ICMP in version 4.

IPv6 addresses are like classless IPv4 addresses in that they are interpreted as having a network identifier part and a host identifier part. A prefix-length number, using CIDR-like notation, is used to indicate the length of the network ID.

### IPv6 Address Size and Address Space

To increase address space in IPv4, we add extra bits and for each bit we give to the address size it doubles the address space.

IPv6 jumps all the way to 128 bits, or 16 8-bit octets/bytes.

This has increased overhead, since every datagram header or other place where IP addreses are referenced must use 16 bytes for each address instead of the 4 bytes needed in IPv4.

Having a 128 bits address space allows you to create a hierarchy of networks while still saving 64 bits for host IDs.

![ipv6-representation](/assets/images/ipv6representation.png)

### Hexadecimal Notation

Grouped into eight 16-bit words, separated by colons, to create the **colon hexadecimal notation**

`805B:2D9D:DC28:0000:0000:FC57:D4C8:1FFF`

**Rules for Compressing IPv6 Addresses**

1. **Zero Suppression** - leading zeros can be suppressed, like so:

`805B:2D9D:DC28:0:0:FC57:D4C8:1FFF`

Only leading zeros (to the left) can be removed.

![zero-supression](https://www.networkacademy.io/sites/default/files/inline-images/shortening-ipv6-addresses-example-3.png)

2. **Zero Compression** - allows a single string of contiguous zeros in an IPv6 address to be replaced by double colons, like this:

`805B:2D9D:DC28::FC57:D4C8:1FFF`

To prevent ambiguity, the double colons **can only be used ONCE per address**.

![zero-compression](https://www.networkacademy.io/sites/default/files/inline-images/shortening-ipv6-address-example-1.png)

Example, the full IPv6 loopback address is written as: `0:0:0:0:0:0:0:1` and after compression it becomes `::1`

In IPv6, the size of an address’s prefix is indicated by the **prefix length that follows the address**, separated with a slash, just as it is done in IPv4 classless addressing.

`805B:2D9D:DC28::FC57:D4C8:1FFF/48`

### IPv6 Address Space Allocations

![ipv6-allocations](/assets/images/ipv6-allocations.png)

## IPv6 Header

![ipv6-header](https://d107a8nc3g2c4h.cloudfront.net/blog/wp-content/uploads/2017/11/ipv4-ipv6.png)

## IPv6 Address Types

- **Unicast Addresses**
    - Standard unicast addresses as in IPv4, one per host interface.

- **Multicast Addresses**
    - Represent various groups of IP devices.
    - A message sent to a multicast address goes to all devices in the group.

- **Anycast Addresses**
    - Used when a message must be sent to any member of a group, but does not need to be sent to all of them.
    - Usually the easiest to reach member of the group is the one who will be sent the message.
    - e.g. load sharing among a group of routers in an org

**Broadcast is gone in IPv6**: a multicast group to which all nodes belong can be used for broadcasting in a network, instead.

![ipv6-types](https://3.bp.blogspot.com/-9HoI2Bm789g/XDYbK5gXTKI/AAAAAAAABTw/MNe_gVI-MH0glZKEQ7IDKTMd_SFvViV4QCLcBGAs/s1600/IPv6%252BAddress%252BTypes%252BIPv6%252BAddressing%2B%25281%2529.jpg)

![ipv6-addresses](https://ccnatutorials.in/wp-content/uploads/2019/11/IPv6-address-types.png)

### Global Unicast Addresses

A full one-eighth slice of the enormous IPv6 address “pie” is assigned to unicast addresses, which are **indicated by a 001 in the first three bits of the address**.

![global-unicast](/assets/images/ipv6-globalunicast.png)

**The 16 bits of subnet ID** allow each site considerable flexibility in creating subnets that reflect the site’s network structure.

Here are some example uses of the 16 bits:
- A smaller organization can just set all the bits in the subnet ID to zero and have a flat internal structure.
- A medium-sized organization could use all the bits in the subnet ID to perform the equivalent of straight subnetting under IPv4, thereby assigning a different subnet ID to each subnet. There are 16 bits here, and this allows a whopping 65,536 subnets!
- A larger organization can use the bits to create a multiple-level hierarchy of subnets, exactly like IPv4’s Variable Length Subnet Masking (VLSM). For example, the company could use two bits to create four subnets. It could then take the next three bits to create eight sub-subnets in some or all of the four subnets. There would still be 11 more bits to create sub-sub-subnets, and so forth.

**The last 64 bits of IPv6 unicast address** are used for interface IDs, which are created in a special format called **modified EUI-64**.

A simple process can be used to determine the interface ID from the 48-bit MAC address of a device like an Ethernet network interface card. This can then be combined with a network prefix (routing prefix and subnet ID) to determine a corresponding IPv6 address for the device.

![eui-64](/assets/images/eui-64.png)

## IPv6 Subnetting

[Link](https://docs.netgate.com/pfsense/en/latest/network/ipv6/subnets.html)

[Video](https://www.youtube.com/watch?v=8IqXQ88QXfc)

IPv6 doesn’t have a subnet mask but instead calls it a Prefix Length, often shortened to “Prefix”.

Prefix length and CIDR masking work similarly; The prefix length denotes how many bits of the address define the network in which it exists.

Most commonly the **prefixes used with IPv6 are multiples of four** but they can be any number between 0 and 128.

## SLAAC - IPv6 Stateless Address Autoconfiguration

One of the most interesting and potentially valuable addressing features implemented in IPv6 is a facility that allows devices on an IPv6 network to actually configure themselves independently.

[Video](https://youtu.be/rcfYWScwgBA)

Stateless autoconfiguration exploits several other new features in IPv6, including link-local addresses, multicasting, the ND protocol, and the ability to generate the interface ID of an address from the underlying data link layer address.

The general idea is to have a **device generate a temporary address until it can determine the characteristics of the network** it is on, and then create a permanent address it can use based on that information.

Summary of steps:

1. **Link-Local Address Generation**
    - Device generates a link-local address
    - Usually derived from MAC address

2. **Link-Local Address Uniqueness Test**
    - Node tests to ensure that the address generated isn't already in use on the LAN
    - Sends a Neighbor Solicitation message using the ND protocol
    - Listens for a Neighbor Advertisement message (indicates that another device is already using its link-local)
    - If so, a new address must be generated

3. **Link-Local Address Assignment**
    - If Uniqueness test passes, device assigns link-local address to its IP interface
    - Address can be used for comms in LAN but not on the wider Internet (not routed)

4. **Router Contact**
    - Node attemps to contact a local router for more info to continue config process
    - Listens for Router Advertisement messages sent periodically
    - Or sends a specific Router Solicitation message to ask a router for information on what to do next

5. **Router Direction**
    - Router provides direction to the node
    - Either gives info on whether stateless autoconfiguration is in use
    - Or gives the address of a DHCP server to user
    - Alternatively, tells the host how to determine its global Internet address

6. **Global Address Configuration**
    - If stateless autoconfiguration is in use, the host configures itself with its globally unique Internet address
    - Generally formed from a network prefix provided to the host by the router
    - Prefix is combined with the device's identifier, as generated in step 1
    - Global Unicast Address with modified EUI-64

Advantages over both manual and server-based configuration:
- Supports the mobility of IP devices
- Devices can move to new networks and get a valid address WITHOUT any knowledge of local servers or network prefixes
- Still allows for managament of IP addresses using DHCPv6

Routers on the local network will tell hosts which type of autoconfiguration (stateless or stateful with DHCP) is supported using special flags in ICMPv6

## ND (Neighbor Discovery) Protocol

Two devices are neighbors if they are on the same local network, meaning that they can send information to each other directly. The term can refer to either a regular host or a router.

The new IPv6 Neighbor Discovery (ND) protocol formalizes for IPv6 a number of functions related to communication between neighbor devices that are performed in IPv4 by protocols such as ARP and ICMP. ND is considered another helper protocol for IPv6 and is closely related to ICMPv6.

![nd-functions](/assets/images/nd-functions.png)

