# Aula 030 - Redes - Proxy, Reverse Proxy and Firewall

## Proxy

[Link](https://en.wikipedia.org/wiki/Proxy_server)

A proxy server is a server application that acts as an intermediary between a client requesting a resource and the server providing that resource.

A proxy server may reside on the user's local computer, or at any point between the user's computer and destination servers on the Internet.

### Forward Proxy

An Internet-facing proxy used to retrieve data from a wide range of sources (in most cases anywhere on the Internet).

**Open Proxy** is a type of forwarding proxy server that is accessible by any Internet user.

Types of open proxies:

- **Anonymous proxy**
    - Reveals its identity as a proxy server but does not disclose the originating IP address of the client.
- **Transparent proxy**
    - Not only identifies itself as a proxy server but with the support of HTTP header fields, the IP address can be retrieved as well.

### Reverse Proxy

A reverse proxy is usually an internal-facing proxy used as a front-end to control and protect access to a server on a private network.

It appears to clients as an ordinary server. Reverse proxies **forward requests to one or more** ordinary servers that will handle the request. The response forwarded by the proxy to the client will be as if it came directly from the original server.

It also performs tasks like:
- **Load balancing**
    - Distributes the load to several web servers, each web server serving its own application area.
    - Translates URLs from externally known URLs to the internal locations.
- **Authentication**
    - Can be used to communicate to a firewall server internal to an organization, providing extranet access to some functions while keeping the servers behind firewalls.
- **Encryption and Decryption**
    - SSL encryption is often not done by the web servers themselves, but by a reverse proxy that is equipped with SSL accelaration hardware.
- **Caching**
    - Caches static content like pictures and other graphical content.

[Video](https://www.youtube.com/watch?v=5cPIukqXe5w)

## Firewall

[Link](https://www.cloudflare.com/en-gb/learning/security/what-is-a-firewall/)

A firewall is a network security device that monitors incoming and outgoing network traffic and decides whether to allow or block specific traffic based on a defined set of security rules.

A firewall can be hardware, software, software-as-a service (SaaS), public cloud, or private cloud (virtual).

[Video](https://youtu.be/kDEX1HXybrU)

### Types of Firewalls

[Video](https://www.youtube.com/watch?v=uGaERP4Npys)

- **Packet Filter**
    - Works in the network layer of the OSI model.
        - Inspects packets transferred between computers.
    - Maintains an access control list (rules defining wanted/unwanted traffic).
    - Based on this list, it decides to either forward or discard the packet.
    - Analyses packets headers: packets may be filtered by source and destination IP addresses, protocol, source and destination ports.

- **Circuit-level Gateway**
    - Works at the session layer of the OSI model.
    - Monitor TCP handshaking between packets to determine whether a requested session is legitimate.
    - Relatively inexpensive and have the advantage of hiding information about the private network they protect.
    - Main disadvantage is that they do not filter individual packets.

- **Application-level Gateway**
    - Also known as firewall proxy.
    - Filters packets according to their intended service.
    - Can examine every layer of the communication, including the application data.
    - Example: Consider the FTP service. The FTP commands like getting the file, putting the file, listing files, and positioning the process at a particular point in a directory tree. Some system admin blocks put command but permits get command, list only certain files, or prohibit changing out of a particular directory.

- **Stateful Inspection**
    - Monitors all activity from the opening of a TCP connection until it is closed.
    - When starting a connection, the firewall builds a database (state table) and stores the connection information.
    - Uisng this table, it dynamically creates firewall rules to allow anticipated traffic.
    - Inspects the actual data being transmitted instead of just the headers.
    - Higher resource requirement and high network performance costs.
