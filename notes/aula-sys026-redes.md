# Aula 026 - Redes

## NAT (Network Address Translation)

[Video - NAT](https://youtu.be/01ajHxPLxAw)

[Video - What are private IP addresses?](https://youtu.be/e0mpE8tpH_8)

The decision to make IP addresses only 32 bits long as part of the original design of IP led to a serious problem when the Internet exploded in popularity beyond anyone’s expectations: the **exhaustion of the address space**.

Classless addressing helped make better use of the address space, and IPv6 was created to ensure that we will never run out of addresses again. However, classless addressing has only slowed the consumption of the IPv4 address space, and IPv6 has taken years to develop and will require years more to deploy.

**IP Network Address Translation (IP NAT or NAT)** is a technique that allows an organization to set up a network using private addresses, while still allowing for communication on the public Internet.

A NAT-capable router **translates private to public addresses and vice versa** as needed. This allows a small number of public IP addresses to be shared among a large number of devices and provides other benefits as well, but it also has some drawbacks.

### Advantages of NAT

- Public IP Address Sharing A large number of hosts can share a small number of public IP addresses. This saves money and also conserves IP address space.

- **Easier Expansion**
    - Since local network devices are privately addressed and a public IP address isn’t needed for each one, it is easy to add new clients to the local network.

- **Greater Local Control**
    - Administrators get all the benefits of control that come with a private network, but can still connect to the Internet.

- **Greater Flexibility in ISP Service**
    - Changing the organization’s ISP is easier, because only the public addresses change. It isn’t necessary to renumber all the client machines on the network.

- **Increased Security**
    - The NAT translation represents a level of indirection.
    - Creates a type of firewall between the organization’s network and the public Internet.
    - More difficult for any client devices to be accessed directly by someone malicious because the clients don’t have publicly known IP addresses.

- **(Mostly) Transparent**
    - NAT implementation is mostly transparent, because the changes take place in one or perhaps a few routers. The dozens or hundreds of hosts themselves don’t need to be changed.

### Disadvantages of NAT

- **Complexity**
    - Represents one more complexity in terms of setting up and managing the network.
    - Makes troubleshooting more confusing due to address substitutions.

- **Problems Due to Lack of Public Addresses**
    - Certain functions won’t work properly due to lack of a real IP address in the client host machines.

- **Compatibility Problems with Certain Applications**
    - Compatibility issues with certain applications that arise because NAT tinkers with the IP header fields in datagrams but not in the application data. This means tools like the File Transfer Protocol (FTP), which pass IP addresses and port numbers in commands, must be specially handled, and some applications may not work.

- **Problems with Security Protocols**
    - e.g. IPsec
    - Designed to detect modifications to headers.
    - Cannot differentiate those changes from malicious datagram hacking.
    - Possible to combine NAT and IPsec, but this becomes more complicated.

- **Poor Support for Client Access**
    - The lack of a public IP address for each client is a double-edged sword; it protects against hackers trying to access a host, but it also makes it difficult for legitimate access to clients on the local network.
    - Peer-to-peer applications are harder to set up, and something like an organizational website (accessed from the Internet as a whole) usually needs to be set up without NAT.

- **Performance Reduction**
    - Each time a datagram is sent from private to public network, an address translation is required.
    - Header checksums need to be recalculated.
    - Each individual translation takes little effort, but when you add it up, you are giving up some performance.


Finally, IPv6 has fixed this issue and turns NAT obsolete.

---

## Exercises

Resolution of class exercices can be found [here](/exercises/aula-sys026-redes-exercises.md)