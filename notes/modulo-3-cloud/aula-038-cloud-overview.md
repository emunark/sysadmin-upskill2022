# Aula 038 - Cloud Basics

## Overview

**What is cloud computing?**

- Delivery of computing services over the Internet
- Includes common IT infrastructure (virtual machines, storage, databases and networking)
- Expand the traditional IT offerings to include IOT, ML and AI
- Increase your IT infrastructure rapidly without the constraints of a physical datacenter
- Pay for only the services you use
- Someone else manages the upkeep of the computer: backups, updates and uptime

There are various definitions for cloud computing:

- Style of computing in which **scalable** and **elastic** IT-enabled capabilities are delivered as a service to external customers using Internet technologies.

- IT capability (services, software, or infrastructure) delivered via Internet technologies in a **pay-per-use, self-service** way.

- On-demand network access to a **shared pool of configurable computing resources** (e.g. networks, servers, storage, applications and services) that can be **rapidly provisioned** with minimal management effort or service provider interaction.

## Key Terminology

- **Capital Expenditure (CapEx)**: One time, upfront expenditure to purchase or secure tangible resources. Then deducting that up-front expense over time. The up-front cost from CapEx has a value that reduces over time.

- **Operational Expenditure (OpEx)**: Spending money on services and products over time. You can deduct this expense in the same year you spend it. There is no up-front cost, as you pay for a service or product as you use it.

- **Elasticity**: Degree to which a system is able to **adapt to workload changes** by provisioning and deprovisioning resources in an automatic manner
    - Available resources match the current demand as closely as possible
    - Most common problems are **over-provisioning** or **under-provisioning**
    - It's difficult to **monitor** elastic applications
    - High requirements and provisioning time

- **Scalability**: Ability to adjust resources to meet demand.
	- **Vertical Scaling**: Need more processing power? Add or remove more CPUs or RAM to your virtual resources.
	- **Horizontal Scaling**: Jump in demain? Scale automatically or manually. Add or remove additional (equal to existing) virtual machines or containers.

- **Reliability**: Ability to recover from system failures and continue to function

- **High Availability**: focuses on maximum availability of resources, regardless of disruptions or events; service availability guarantees are part of the service-level agreements (SLAs)

- **Performance Predictability**:
	- **Autoscaling** - deploy additional resources to meet demand or scale back when demand drops
	- **Load balancing** - redirect some of the overload to less stressed areas

- **Cost Predictability**: Apply data analytics to find patterns and trends to plan resource deployments
	- Monitor resources to ensure that you're using them efficiently



- **Portability**: Ability to move applications, data, tools from one cloud provider to another

- **Interoperability**: Ability of different cloud providers to interact together

- **Federation**: Act of combining services from various cloud providers to provide a solution

## Pros and Cons

**Pros:**

- Low CapEx investment in infrastructure
- Independence on the location of the client
- High availability, scalability and elasticity
- Resource abstraction and ease of use
- Resource virtualization
- Pay-per-use costs

**Cons:**

- Strong dependency on the Internet
- Failure may occur on data recovery
- Security vulnerabilities by exposure to the internet
- Very specific regulations on privacy and security
- Limited customization of services
- **Vendor lock-in**:
    - Significant cost to move from one cloud vendor to another

## Service Models

### IaaS

Places **most responsability on the consumer**, cloud provider is responsible for the basics of physical security, power and connectivity.

- Scenarios: lift-and-shift migration (moving from on-prem datacenter to IaaS infrastructure) and testing and development (established configurations for development and test environs that you need to rapidly replicate)

### PaaS

Evenly distributes **responsability between cloud provider and consumer**.

- Scenarios: development framework (devs can develop or customize cloud-based apps) and analytics or business intelligence

### SaaS

Places most of the **responsability with the cloud provider**.

- Scenarios: email and messaging apps, business productivity apps, finance and expense tracking

![responsibilities](https://learn.microsoft.com/en-us/training/wwl-azure/describe-cloud-compute/media/shared-responsibility-b3829bfe.svg)

You’ll always be responsible for:

- The information and data stored in the cloud
- Devices that are allowed to connect to your cloud (cell phones, computers, and so on)
- The accounts and identities of the people, services, and devices within your organization

The cloud provider is always responsible for:

- The physical datacenter
- The physical network
- The physical hosts

Your service model will determine responsibility for things like:

- Operating systems
- Network controls
- Applications
- Identity and infrastructure

## Deployment Models

![cloud-models](/assets/images/cloud-models.png)

- **Private Cloud** (e.g. NASA, CERN)
	- **Single Tenant**:Used by a single entity
	- Greater costs and fewer benefits of a public cloud deployment (**security concerns**)
	- Compliance norms (e.g. SOC, PCI DSS)
	- Hybrid deployments: may integrate your on-site datacenter or hardware
	- Fully-managed solution (therefore more customisable)

- **Public Cloud** (e.g. Microsoft, Amazon, Google)
	- **Multi-tenant**: customers buy server slices
	- Utility model: pay-as-you-go, no contracts
	- Built, controlled and maintained by a third-party cloud provider
	- Accessible to anyone that wants to purchase cloud services
	- Partial control of performance (add resources) + SLA

- **Hybrid Cloud**
	- Both public and private clouds in an inter-connected environment
	- Allow a private cloud to surge for increased, temporary demand by deploying public cloud resources
	- Can be used for an extra layer of security (choose which services to keep public or private)

Others:

- **Multi-cloud**
	- Deal with two (more) public cloud providers and manage resources and security in BOTH environments

- **Community Cloud** (e.g. GEANT)
	- Shared by institutions with common interest
	- Can be managed by one of them or a separate one

## Security and Governance

**Governance**

- Set templates help ensure that all your deployed resources meet corporate standards and government regulatory requirements
- Update your deployed resources to meet new standards
- Cloud-based auditing helps flag any out of compliance resource

**Security**

- IaaS provides maximum control of security
- PaaS and SaaS get patches and maintenance taken care of automatically
- Cloud providers can deal with things like DDoS attacks

## Management of the cloud

- Automatically scale resource deployment based on need.
- Deploy resources based on a preconfigured template, removing the need for manual configuration.
- Monitor the health of resources and automatically replace failing resources.
- Receive automatic alerts based on configured metrics, so you’re aware of performance in real time.

**Management tools**

- Through a web portal.
- Using a command line interface.
- Using APIs.
- Using PowerShell.