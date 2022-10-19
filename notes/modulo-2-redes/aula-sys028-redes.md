# Aula 028 - Redes - Layer 7 Protocols, DHCP and DNS

## DHCP - Dynamic Host Configuration Protocol

Built using BOOTP as a foundation, with the same basic message format.

The most significant addition in DHCP is the **ability to dynamically assign addresses to clients and to centrally manage them**.

Today, DHCP is the standard TCP/IP host configuration protocol and is used in everything from single-client home networks to enterprise-class internetworks.

### From BOOTP to DHCP

BOOTP is a higher-layer protocol, not hardware-dependent like RARP (older, deprecated protocol).

- Supports sending extra information beyond an IP address to a client to enable customized configuration.
- Through the use of BOOTP relay agents, it allows a large organization to use just one or two BOOTP servers to handle clients spread out over many physical networks.
- BOOTP effectively solves the “I have to go configure each host myself” issue.
- Allows “dumb” (storageless) hosts to configure themselves automatically and saves administrators the hassles of needing to trek to each host individually to specify important configuration parameters.

BOOTP uses a **static method of determining what IP address** to assign to a device:
- When a client sends a request, it includes its hardware address, which the server looks up in a table to determine the IP address for that client.
- It offered no way to reuse addresses; once an address had been assigned, a device could keep it forever.

A new host configuration protocol was needed to serve modern networks, which would move away from static, permanent IP address assignment.

## DHCP Overview

The Dynamic Host Configuration Protocol (DHCP) is the host configuration protocol currently used on modern TCP/IP internetworks.

Based on BOOTP and similar to its predecessor in many respects, including the use of request/reply message exchanges and a nearly identical message format. However, DHCP includes added functionality, the most notable of which is **dynamic address assignment, which allows clients to be assigned IP addresses from a shared pool** managed by a DHCP server.

Three basic mechanisms for address assignment:

- **Dynamic Allocation**: each client leases an address from a DHCP server for a period of time. The server chooses the address dynamically from a shared address pool.

- **Automatic Allocation**: Like dynamic allocation, but the address is assigned permanently instead of being leased.

- **Manual Allocation**: Preassigns an address to a specific device, just as BOOTP does, and is normally used only for servers and other permanent, important hosts.

### DHCP Operation

![dhcp-operation](/assets/images/dhcp-operation.png)

The broadcast ensures that all the responding DHCP servers know that the client has chosen a server.

The servers that are not chosen can cancel the reservations for the IP addresses that they had offered.

The selected server allocates the IP address for the client and stores the information in the DHCP data store.

## DNS

[Video](https://www.youtube.com/watch?v=mpQZVYPuDGU)

### A part of Internet history

- Late 1960s and early 1970s, the predecessor of the Internet, called the ARPAnet, was in use (with the predecessors of TCP and IP) and contained only a few machines. Numeric address were easy to memorize due to the very small amount of machines in use.

- With growth of number of machines, ARPAnet engineers decided that symbolic names were much easier to work with than numeric addresses.

- Each host had a host name in a host table and each site managed its own host table.

- ARPAnet recognized the dangers of having each site maintain a list of possibly inconsistent host names.

- A "master" text file was created and maintained at Stanford University. This file could be downloaded using network protocols like FTP.

- The continuing growth of the ARPAnet/Internet made it apparent that the simple host table name system would eventually become unmanageable. With at first dozens, and then hundreds and thousands of new hosts connecting to the internetwork, a single text file maintained in a central location just wasn’t up to the task.

**Example TCP/IP host table:**

```
# Host Database
# This file should contain the addresses and aliases
# for local hosts that share this file.
#
# Each line should take the form:
# <address>     <host name>
#
127.0.0.1       localhost
209.68.14.80    www.pcguide.com
216.92.177.143  www.desktopscenes.com
198.175.98.64   ftp.intel.com
```

## DNS Overview

The most important paradigm shift made by the TCP/IP engineers was the decision to **change the name system from one that used a single, centralized list of names** to a more decentralized system. The idea was to create a structured topology where names were **organized into domains**.

![dns-functions](/assets/images/dns-functions.png)

### 1. DNS Name Space

Organized starting from a single root into which containers (called **domains**) are placed. Each can contain either individual device names or more specific subcontainers.

![dns-tree](/assets/images/dns-tree.png)

![dns-labels](/assets/images/dns-labels.png)

A **fully qualified domain name (FQDN)** is a complete domain name that uniquely identifies a node in the DNS name space by giving the full path of labels from the root of the tree down to that node.

*Example:*
Salt.Crystal.Rocks.

In contrast, a **partially qualified domain name (PQDN)** specifies only a portion of a domain name. It is a relative name that has meaning only within a particular context. The partial name must be interpreted within that context to fully identify the node.

*Example:* The domain name for the department as a whole is “cs.widgetopia.edu.”, and the individual hosts you manage are named after fruit. In the DNS files you maintain, you could refer to each device by its FQDN every time; for example, “apple.cs.widgetopia.edu.”, “banana.cs .widgetopia.edu.”, and so on. But it’s easier to tell the software, “If you see a name that is not fully qualified, assume it is in the cs.widgetopia.edu domain.” Then you can just call the machines apple, banana, and so on. Whenever the DNS software sees a PQDN such as kiwi, it will treat it as “kiwi.cs.widgetopia.edu.”

**The dot is used to clearly distinguish a FQDN from a PQDN within DNS master files.** This allows us to use both FQDNs and PQDNs together. In our example, apple would refer to “apple.cs.widgetopia.edu.”, but “apple.com.” would refer to the FQDN for Apple Computer, Inc. You must be careful about watching the dots here, because apple.com (without a trailing period) would be
a PQDN and would refer to “apple.com.cs.widgetopia.edu.”, not the domain of Apple Computer.

### 2. Name Registration (Including Administration and Authorities)

Based on the idea of a hierarchy of domains and registration authorities responsible for them.

#### **The DNS Root Domain Central Authority**

The central DNS authority for the Internet, which **controls the creation of TLDs**, was initially called the Network Information Center. It was later the Internet Assigned Numbers Authority (IANA), which is also responsible for protocol numbers, IP addresses, and more. These functions are now shared by IANA and the Internet Corporation for Assigned Names and Numbers (ICANN).

- **Why are there only 13 DNS root server addresses?**

Limitations in the original architecture of DNS require there to be a maximum of 13 server addreses in the root zone. Initially, there was only ONE server for each of the 13 IP addresses but now each IP address used to query the different root networks actually splits their load between hundreds of servers across the world.

- **Who operates DNS root servers?**

![root-servers](/assets/images/root-servers.png)

[Root Servers](https://root-servers.org)

- **Why 13 root servers?**

DNS is based off of IPv4.

Server IPs needed to fit in ONE packet, limited to 512 bytes.

Every DNS entry associated to a root server needs 32 bytes (root domain name, IP address, TTL) so 13 * 32 = 416 bytes. The leftover 96 bytes are for packet PCIs.

![dns-message](https://notes.shichao.io/tcpv1/figure_11-6.png)

#### **TLD Authorities**

Create second-level domains within each of the TLDs. Each TLD must itself be managed using a coordinating authority, however, this is not necessarily the organization that runs the root (IANA). IANA delegates authority for some of the TLDs to other organizations.

![dns-tlds](/assets/images/dns-tlds.png)

**gTLD (Generic Top-Level Domains):** .COM, .NET, .ORG, .INFO, etc.

**ccTLD (Country-Code Top-Level Domains):** .US, .CA, .UK, .PT, etc.

**newGTLD (New Generic Top-Level Domains):** .SHOP, .EMAIL, .HOTELS, .RADIO, etc.

#### **Lower Level Authority Delegation**

If we use an organizational hierarchy, like the .COM TLD, we generally delegate authority for each second-level domain to the organization whose name it represents. So, for example, IBM.COM is managed by IBM. Since IBM is huge, it may itself sub- divide the authority structure further, but smaller organizations probably won’t.

The information about name registrations is maintained in resource records stored in various locations, which form **a distributed name database** on the Internet.

![dns-authority](/assets/images/dns-authority.png)

An authorative server for a zone is one that maintains the official information about the zone, and is responsible for providing name resolution information for the zone.

There are two DNS Name Server types and roles:

- **Master DNS server**
    - Primary server for a zone, which maintains the master copy of DNS information.

- **Slave or secondary DNS server**
    - Backups for the primary server.
    - Share the load of responding to requests in busy zones.
    - They get their information from primary servers on a routine basis.

**Both master and slave servers are considered authoritative** for the zones whose data they maintain.



### 3. Name Resolution

Similarly hierarchical, designed around interaction between name resolver and name server software that consult databases of DNS resource records and communicate using a special messaging protocol to answer client queries.

**Iterative DNS name resolution**

![iterative-dns](/assets/images/iterative-dns.png)

**Recursive DNS name resolution**

![recursive-dns](/assets/images/recursive-dns.png)

Example of DNS name resolution process

![dns-nameresolution](/assets/images/dns-nameresolution.png)

[Video](https://www.youtube.com/watch?v=3EvjwlQ43_4)

### CNAME Records - Changes to Resolution to Handle Aliases

When a CNAME is used, it changes the name resolution process by adding an extra step: First **we resolve the alias to the canonical name, and then we resolve the canonical name**.

Example:

- Web servers are almost always named starting with www., so at XYZ Industries, we want people to be able to find our website at www.xyzindustries.com.

- However, the web server may be shared with other services on bigserver.xyzindustries.com.

- We can set up a CNAME record to point www.xyzindustries.com to bigserver.xyzindustries.com.

- Resolution of www will result in a CNAME pointing to bigserver, which is then itself resolved.

- If in the future, our business grows and we decide to upgrade our web service to run on biggerserver.xyzindustries.com, we just change the CNAME record, and users are unaffected.

### DNS Name Server Data Storage - Resource Records (RRs)

DNS name servers store DNS information in the form of **resource records (RRs)**. Each RR contains a particular type of information about a node in the DNS tree.

![dns-rrs](/assets/images/dns-resourcerecords.png)

Rather than creating **a single Address (A) RR for a DNS domain name, it is possible to create multiple ones**. This associates several IP addresses with one name, which can be used to spread a large number of requests for one domain name over many physical IP devices. **Allows for load balancing for busy Internet servers**.

### DNS Caching and TTL

Caching is an essential efficiency feature that reduces DNS message traffic by eliminating unnecessary requests for recently resolved names. **Whenever a name is resolved, the resulting DNS information is cached so it can be used for subsequent requests** that occur shortly thereafter.

Cached information can become stale over time and result in incorrect responses sent to queries. Each RR can have associated with it a time interval, called the **Time to Live (TTL)**, that **specifies how long the record may be held in a cache**. The value of this field is controlled by the owner of the RR, who can tailor it to the specific needs of each RR type.

### DNS over TLS (DoT)

Original DNS communication is **unencrypted**.

That means that everyone between your device and the DNS resolver can see and even modify queries and responses. It can affect your **privacy** and **security**.

- DNS over TLS (DoT) embeds the original DNS communication into **a secure and encrypted TLS channel**.

- DoT uses a different port to communicate (port 853) instead of DNS port 53.

### DNS over HTTPS (DoH)

- Uses the same port as all encrypted web traffic: port 443.

- Designed to **prevent cases where the DoT port may be blocked**

- Enables web applications to access DNS through existing browser APIs

- Only the people who run the DoH resolver and you can see the query.

