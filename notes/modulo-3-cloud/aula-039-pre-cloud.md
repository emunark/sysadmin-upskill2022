# Aula 039 - Technology that Preceeded the Cloud

## Cluster

[Video](https://youtu.be/7rooWbLe1iI)

Independent IT resources interconnected and **working as a single system**.

Acts as a **single computer connected to a network**.

All resources of the cluster:

- Belong to the same entity
- Have the same purpose
- Share the same software
- (Usually) have the same OS
- Same room or building (connected by a high performance network)
- Have strict data access policies to ensure data security

![cluster](/assets/images/clusters.png)

### Cluster Types

- Fail-over

![failover](http://lh4.ggpht.com/_p2ZBNGf_7w8/TbDNNN07n8I/AAAAAAAAGfo/TMKBHwMsAew/image_thumb[26].png?imgmax=800)

- Load-balancing

![loadbalancing](http://4.bp.blogspot.com/-tS2NXSJuce4/T9ngpB-tttI/AAAAAAAAAFQ/X0-1khhRJas/s1600/loadbalancing.png)

- High Performance Computing

## Grid Computing

[Video - The Grid, CERN's Global Supercomputer](https://youtu.be/7rooWbLe1iI)

Logical pools of IT resources. Creates a "super" virtual computer, made of heterogeneous resources that can be geographically distributed and are task indepedent.

A grid computing system requires:

- At least one computer to handle all administrative duties
- Network of computers running special grid computing software
- Collection of computer software called middleware

All resources of the grid:

- Belong to the same entity
- Have the same purpose
- May not share the same software
- May have different OS
- May be located in different geographic locations
- Have strict data access policies to ensure data security

![distributed](https://cdn.ttgtmedia.com/rms/onlineimages/the_distributed_computing_process-f.png)

## Virtualization

Platform for the creation of virtual instances of IT resources

- Decoupling from Hardware/real resource
- Tighter definitin of hardware requirements
- Encapsulation (VM as a unit)
- Allows for multiple images
- Allows resource sharing

### Virtual Clusters

Virtual Clusters are just cluster systems, but deployed using Virtual Machines over a network.

- Can provision clusters dynamically
- Manage different guest OSs, environments
- Increases application flexibility
- Virtual Clusters share physical resources and keep application isolation

![virtualoverview](https://ars.els-cdn.com/content/image/3-s2.0-B9780128022580000020-f02-12-9780128022580.jpg)
![virtualclusters](https://img.brainkart.com/imagebk12/veXOERg.jpg)

## Other Terminology

- Data Center Technology [Video](https://www.youtube.com/watch?v=Amow8BJm5Go)
    - [Inside a Google Datacenter](https://www.youtube.com/watch?v=XZmGGAbHqa0)

- **HPC** (High Performance Computing):
    - Sharing the workload of **interdependent** processes over multiple cores to **reduce overall compute time**
    - Emphasis on access to **fastest cores**, CPU homogeneity, special coding, shared filesystems and fast networks
    - Large amounts of computing power for **short periods of time**
    - [Video](https://www.youtube.com/watch?v=jBsc83_4RsQ&pp=ugMICgJlbhABGAE%3D)
    - [Video - Supercomputer Fugaku](https://youtu.be/6Xn3Z30zqUc)

- **HTC** (High-Throughput Computing):
    - Change of paradigms: HPC -> HTC
    - **Large workflows of numerous, relatively small and independent processes** that can run on 1 or few processors on the same computer
    - Best accelerated by **access to as many cores as possible***
    - Used when **problems can be parallelised**
    - Most important: Maximized number of running tasks
    - Less important: CPU speed, homogeneity
    - Throughput is a measure of how many units of information a system can process in a given amount of time
    - HTC tasks require large amounts of computing **over a long period of time** (months and years)
    - Useful for, e.g. Internet searches and Web services accessed by millions simultaneously

![hpcvshtc](https://image.slidesharecdn.com/cmp318-161217192036/95/aws-reinvent-2016-building-hpc-clusters-as-code-in-the-almost-infinite-cloud-cmp318-4-638.jpg?cb=1482002470)

- **P2P** (Peer-to-Peer)
    - Client-Server architecture
    - Used for distributed file sharing and content delivery applications
    - All nodes are both client AND server
    - Peer machines are globally distributed
    - [Video](https://www.youtube.com/watch?v=w2u4eN_WWvc)
