# Aula 029 - Redes - LDAP and Active Directory

## LDAP - Lightweight Directory Access Protocol

Protocol that helps users find data about organizations, persons, and more.

[Video](https://youtu.be/5rEA7vRV3VE)

### Main goals:

- To store data in the LDAP directory
- Authenticate users to access the directory

It also provides communication language that applications require to send and receive info from directory services.

- What is a **directory service**?
    Most popular example is Microsoft's Active Directory. It provides access to *where* information on organizations, individuals, and other data is located within a network.

LDAP also functions as an **identity and access management (IAM)** solution that targets user authentication, including support for Kerberos and single sign-on (SSO), Simple Authentication Security Layer (SASL), and Secure Sockets Layer (SSL).

### LDAP authentication process

Client-server model of authentication

Key players:
- **Directory System Agent (DSA)**
    - A server running the LDAP on its network
- **Directory User Agent (DUA)**
    - Accesses DSAs as a client (ex. a user’s PC)
- **Distinguished Name (DN)**
    - Contains a path through the directory information tree (DIT) for LDAP to navigate through (ex. cn=Susan, ou=users, o=Company)
- **Relative Distinguished Name (RDN)**
    - Each component in the path within the DN (ex. cn=Susan)
- **Application Programming Interface (API)**
    - Lets your product or service communicate with other products and services without having to know how they’re implemented

**Process description:**

1. User tries to access LDAP-enabled client program, like a business email application on their PC.

2. With LDAPv3, users go through an authentication method like SSO or SASL.

3. Login attempt sends a request to authenticate the DN assigned to the user.

4. The DN is sent through the client API or service that launches the DSA.

5. Client automatically binds to the DSA, and LDAP uses the DN to search for the matching object or set of objects in its database.

6. Once user receives a (valid or not valid) response, the client unbinds from the LDAP server.

7. Authenticated users are then able to access the API and its services, including files, user info and other app data, based on permissions granted.

### LDAP Directory Information Tree (DIT)

[Link](https://ldapwiki.com/wiki/Directory%20Information%20Tree)

![ldap-dit](https://ldapwiki.com/attach/DIT/DIT.png)

**Domain Access Component  (dc)**

The dc (i.e. dc=com, dc=example) uses domain name system (DNS) mapping to locate Internet domain names and translate them into IP addresses.

**Organization Name (o)**

The o subclass (ex. o-Company) is one of the most general subclasses listed in the DN, and it is usually where LDAP starts when it runs a search.

**Organizational Unit (ou)**

The ou is a subclass of o and is often seen as ou=users or ou=group, with each containing a list of user accounts or groups.

**Common name (cn)**

A common name, or cn, is used to identify the name of a group or individual user account (ex. cn=developers, cn=Susan). A user can belong to a group, so if Susan is a developer, they could also live under cn=developers.

### Attributes and Values

- `attribute=value`
    - e.g. `name=Susan`
    - Susan would be the value of the `name` attribute

In the cn=Susan account:

- The user id (uid) and userPassword are attributes and a user's login credentials are the values.

In a group cn=developers:

- Susan would have the uniqueMember attribute
- e.g. `uniqueMember=cn-Susan,ou-Users,o-Company`
- This maps a path to where Susan’s individual user account is located, along with the information LDAP is searching for.

## Microsoft's Active Directory

[Video](https://www.youtube.com/watch?v=GfqsFtmJQg0)

[Video 2](https://www.youtube.com/watch?v=85-bp7XxWDQ)

It's a **directory service**, using LDAP as the core protocol.

Part of the Windows Server operating system or more recently, part of the Azure ecosystem.

### Active Directory Domain Services (AD DS)

[Link](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview)

A **directory** is a hierarchical structure that stores information about objects on the network.

A **directory service**, such as Active Directory Domain Services (AD DS), provides the methods for storing directory data and making this data available to network users and administrators.

For example, AD DS stores information about user accounts, such as names, passwords, phone numbers, and so on, and enables other authorized users on the same network to access this information.

**Domain Services are provided by the DC** (Domain Controller, a server that executes AD DS) to the rest of the domain or tree to allow identity, permission and access management.

- LDAP: provides communication between apps and directory services.

- Certificate Services: allow domain controllers to create, validate and revoke public key certificates.

- DNS: name resolution for IP hosts.

AD DS also includes:

- **Schema**
    - Set of rules that defines the classes of objects and attributes contained in the directory

- **Global Catalog**
    - Contains information about every object in the directory.
    - Allows users and admins to find directory information regardless of which domain in the directory actually contains the data.

- **Replication service**
    - Organizations usually have multiple DC's with a directory copy EACH.
    - Any modifications made to one DC will be replicated to other DC's so they can all stay updated.

### AD Logical Model

[Link](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/understanding-the-active-directory-logical-model)

![ad-structure](https://miro.medium.com/max/730/1*AOa14MRNG1SFrbU6oI7lAw.png)

- Forest:
    - Collection of one or more AD domains that **share a common structure, scheme, directory configuration and global catalog.**
    - A forest can contain **multiple trees**. A tree is made of **multiple domains**.
    - Serves as a **Security limit**:
        - Objects in different forests cannot interact with each other, unless the forest admins create a **trust relationship**.
- Domain:
    - A partition in an AD forest.
    - Partioning data enables orgs to replicate data only to where it's needed.
    - Allow for user identities to be created once and referenced on ANY computer joined to the forest in which the domain is located.
    - Serves as a **Management frontier**:
        - Objects on a domain are stored in a single database and can be managed together.
- Organization Units:
    - Used to form a hierarchy of containers within a domain.
    - Group objects for admininstrative purposes such as the application of **Group Policies**

### Trust Relationships

[Link](https://learn.microsoft.com/en-us/azure/active-directory-domain-services/concepts-forest-trust)

![trust-flows](https://learn.microsoft.com/en-us/azure/active-directory-domain-services/media/concepts-forest-trust/trust-relationships.png)

Trust relationships can be either **one-way** or **two-way**

- One-way trusts
    - Unidirectional authentication path between two domains
    - In a one-way trust between Domain A and Domain B, **users in Domain A can access resources in Domain B**.
    - However, **users in Domain B can't access resources in Domain A**.

- Two-way trusts
    - Domain A trusts Domain B and Domain B trusts Domain A.
    - Authentication requests can be passed between the two domains in BOTh directions.

ALL domain trusts inside an AD DS forest are two way, transitive trusts.

- Transitive:
    - Can be used to **extend trust relationships** with other domains.
- Non-transitive:
    - Can be used to **deny trust relationships** with other domains.

### Operation Masters

[Link](https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/fsmo-roles)

To prevent conflicting updates in Windows, the Active Directory performs updates to certain objects in a single-master fashion.

In a single-master model, **only one DC in the entire directory is allowed to process updates**.

Active Directory extends the single-master model found in earlier versions of Windows to include multiple roles, and the ability to transfer roles to any DC in the enterprise. Because **an Active Directory role isn't bound to a single DC**, it's referred to as an FSMO role.

Currently in Windows there are five FSMO roles:

- **Schema master**
    - Responsible for performing updates to the directory schema.
- **Domain naming master**
    - Responsible for making changes to the forest-wide domain name space of the directory.
    - Only one that can add or remove a domain from the directory.
- **RID master**
    - Responsible for processing RID Pool requests from all DCs within a given domain.
    - When a security principal, like user or group, is created by a DC, it attaches a unique Security ID (SID) to that object. This SID contains a RID (Relative ID) that's unique for each security principal created in a domain.
    - Each DC in a domain is allocated a pool of RIDs that it's allowed to assign to the security principals it creates.
    - When a DC's allocated RID pool falls below a threshold, that DC issues a request for additional RIDs to the domain's RID master.
- **PDC emulator**
    - Necessary to synchronize time in an entreprise.
    - Password changes done by other DCs in the domain are replicated preferentially to the PDC emulator.
    - Account lockout is processed on the PDC emulator.
- **Infrastructure master**
    - Responsible for updating an object's SID and distinguished name in a cross-domain object reference.

### Authentication

- **Kerberos**
    - Works on the basis of tickets and requires a trusted party
    - Default authentication protocol on Windows versions since Windows 2000
    - [More info](https://learn.microsoft.com/en-us/windows-server/security/kerberos/kerberos-authentication-overview)

![kerberos](https://info.varonis.com/hubfs/Imported_Blog_Media/Kerberos-Graphics-1-v2-1260x1265.jpg)

- **NTLM** (NT LAN Manager)
    - Challenge-response authentication protocol that was used before Kerberos
    - [More info](https://learn.microsoft.com/en-us/windows-server/security/kerberos/ntlm-overview)

![ntlm](https://www.ionos.com/digitalguide/fileadmin/_processed_/a/d/csm_server-during-ntlm-authentication_7e8a198489.png)
