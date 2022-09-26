# Aula 021 - Redes

## **Base teórica da comunicação de dados**

Jean-Baptiste Fourier provou que a função estável f(t) com o período de tempo T pode ser construída como a soma de um número de senos e co-senos, permitindo a representação do valor da tensão ou corrente com um valor único.

# Physical Layer (Cont.)

[Link](https://en.wikipedia.org/wiki/Physical_layer)

In the OSI model, the first layer is the physical layer which is dedicated to transmission media.

This layer handles:

- **Bits transportation**
    - Encoding and Signaling
    - Modulation

- **Effects on signal transmission**
    - Transmission impairment
    - Transmission errors

- Types of **transmission media**
    - Guided/Bounded/Wired media:
        - Twist pair cable
        - Coaxial cable
        - Optical fiber
    - Unguided/Unbounded/Wireless media:
        - Broadcast Radio
        - Cellular Radio
        - Microwaves
        - Infrared
        - Communications Satellite

- **Sharing over transmission media**
    - Multiplexing
    - Circuit Switching (Comutação)
    - Packet Switching
    - Message Switching

---

## Bits transportation: signal transmission (Transporte de bits: transmissão de sinais)

The transportation of data can be done through computers as well as other types of telecommunication devices with the help of signals. These are broadcasted from one device to another in the shape of electromagnetic energy.

In a copper-based network, the bits in the form of electrical signals.

In a fibre based network, the bits in the form of light pulses. [How does light carry data - Video](https://www.youtube.com/watch?v=G1Ke-H8I1uk)

The electrical signals can be sent through the copper wire, fibre optics, atmosphere, water, and vacuum.

The characteristics and quality of data transmission are determined by the characteristics of medium and signal.

### Baseband vs Broadband (Banda de Base vs. Banda Passante)

[Link](https://www.geeksforgeeks.org/difference-between-broadband-and-baseband-transmission/)

- **Baseband** is a transmission form in which the (typically) digital signals are sent through direct current (DC) pulses applied to the wire.

    - Uses a single data channel in which the whole bandwidth of the transmission medium is dedicated to one data channel at a time.

- **Broadband** is a transmission form in which signals are modulated as radiofrequency (RF) pulses that use different frequency ranges.

    - Multiple data channel system, in which the bandwidth of the transmission medium carries several data streams at the same time.

![basebroadband](https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F2.bp.blogspot.com%2F-eTPsW40tID0%2FUaRHWMH8BbI%2FAAAAAAAAIws%2FSiT59SYIZH4%2Fs1600%2Fdifference%2Bbetween%2BBaseband%2Band%2BBroadBand.gif&f=1&nofb=1)

The modem is performing **modulation** (conversion) on the digital waveforms into analog waveforms.

- Binary Phase Shift Keying (BPSK) for celular networks, wifi and bluetooth

- Quadrature Phase Shift Keying (QPSK) for satellite communication

On modulation: [Video 1](https://www.youtube.com/watch?v=mfSWO3TpGq4) [Video 2](https://www.youtube.com/watch?v=qGwUOvErR8Q)

---

## Effects on signal transmission

- **Attenuation**
    - The strength of the signal decreases with increasing the distance which causes the loss of energy.

- **Distortion**
    - Occurs when there is a change in the shape of the signal. This type of distortion is examined from different signals having different frequencies. Each frequency component has its own propagation speed, so they reach at a different time which leads to the delay distortion.

- **Noise**
    - When data is travelled over a transmission medium, some unwanted signal is added to it which creates noise.

- **Crosstalk** (diafonia)
    - Occurs when a signal transmitted on one cable interferes and corrupts the signal transmitted on another cable in close proximity.

CONCLUSION: O sinal recebido é resultado do sinal transmitido e das perturbações (ruído) sofridas durante a sua transmissão.

![errodebit](/assets/images/errodebit.png)

**Imagem**: Representação de erros usando “0” e “1”

Mathematical represantion (XOR bit by bit):

`R = T⊕E `

[What is a XOR gate](https://www.youtube.com/watch?v=gI-qXk7XojA)

---

## Types of Transmission Media

[Link](https://www.geeksforgeeks.org/types-transmission-media/)

![transmissionmedia](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-I0H1AVA7taA%2FXMGpFR0daSI%2FAAAAAAAAIgk%2FQfP9L_jz9jgE66o5N99XjDqqW8HZ_ztZwCEwYBhgL%2Fs1600%2Fclassification-of-transmission-media.png&f=1&nofb=1)

**What is a transmission medium?** It's a physical path between the transmitter and the receiver i.e. it is the channel through which data is sent from one place to another.

**Guided/Bounded (or wired) media**
    - Medium characteristics are more important. [Link](https://sites.google.com/site/pnutpck11/lesson-8---physical-transmission-media)

![guidedmedia](https://i.ytimg.com/vi/0rFZtCovx28/maxresdefault.jpg)

**Unguided/Unbounded (or wireless) media**
    - Signal characteristics are more important. [Link](https://sites.google.com/site/pnutpck11/lesson-9---wireless-transmission-media)

- Cellular Networks [Video](https://www.youtube.com/watch?v=SdtCkGacrg0)

![mobilenetworks](/assets/images/mobilenetworks.png)

Different transmission media have different properties such as bandwidth, delay, cost and ease of installation and maintenance.

---

## Communications Equipment (PHY Layer)

Physical layer technologies are at the very lowest level and deal with the actual ones and zeroes that are sent over the network. For example, when considering network interconnection devices, the simplest ones operate at the PHY layer: **repeaters**, **conventional hubs**, and **transceivers**. These devices have absolutely no knowledge of the contents of a message. They just take input bits and send them as output.

Devices like **switches** and **routers** operate at higher layers and look at the data they receive as being more than voltage or light pulses that represent one or zero.

- **Network Cards**
    - A network interface card (NIC) is a hardware component installed in a computer that provides a dedicated network connection to the computer.
    - Coordinates the transmission and receipt of data, instructions, and information to and from the computer or device containing the network card.
    - Can be used for both wired and/or wireless communications.
    - Allows communications between computers connected via local area network (LAN) as well over large-scale network through Internet Protocol (IP).
    - It's both a physical layer and a data link layer device.
    - Between other components, Network cards (NIC) include important components like **Line Encoders** and **Modulators**

- **Line Coders**
    - [What is a line coder](https://labvolt.festo.com/solutions/60-9464-00_line_coder)
    - Encoding or line encoding is a method of converting a stream of data bits into a predefined "code”. Codes are groupings of bits used to provide a predictable pattern that can be recognized by both the sender and the received. In the case of networking, encoding is a pattern of voltage or current used to represent bits; the 0s and 1s.
    - Common encoding methods include **Manchester code** and **Non-return to Zero (NRZ)**
    - [More Info](https://en.wikipedia.org/wiki/Line_code)

- **Modems**
    - A **modulator-demodulator** or **modem** is a computer hardware device that converts data from a digital format into a format suitable for an analog transmission medium such as telephone or radio.
    - Transmits data by modulating one or more carrier wave signals to encode digital information, while the receiver demodulates the signal to recreate the original digital information.
    - The goal is to produce a signal that can be transmitted easily and decoded reliably. Modems can be used with almost any means of transmitting analog signals, from light-emitting diodes to radio.
    - [More Info](https://en.wikipedia.org/wiki/Modem)

---

## Sharing over Transmission Media (Partilha do Meio de Tx por vários utilizadores)

[Link 1](https://en.wikipedia.org/wiki/Multiplexing) | [Link 2](https://www.geeksforgeeks.org/types-of-multiplexing-in-data-communications/)

![muxing](https://digitalnoteshub.com/wp-content/uploads/2020/12/Multiplexing-2048x1152.png)



- **Multiplexing** (sometimes contracted to muxing) is a method by which multiple analog or digital signals are combined into one signal over a shared medium.
    - Allows sharing over a scarce resource - a physical transmission medium.
    - For example, in telecommunications, several telephone calls may be carried using one wire.

There are two main types of muxing:

1. Frequency Division Multiplexing (FDM)
    - FDM achieves the combining of several signals into one medium by **sending signals in several distinct frequency ranges over a single medium**.
    - Signals are electrical.
    - Most common applications are traditional radio and television broadcasting from terrestrial, mobile or satellite stations, or cable television.

![FDM](http://www.physics-and-radio-electronics.com/blog/wp-content/uploads/2018/11/frequencydivisionmultiplexing.png)

2. Time-Division Multiplexing (TDM)
    - Time-division multiplexing (TDM) is a digital (or in rare cases, analog) technology which **uses time, instead of frequency**, to separate the different data streams.
    - Involves sequencing groups of a few bits or bytes from each individual input stream, one after the other, and in such a way that they can be associated with the appropriate receiver.
    - If done sufficiently quickly, the receiving devices will not detect that some of the circuit time was used to serve another logical communication path.

![TDM](https://www.myreadingroom.co.in/images/stories/docs/dcn/Synchronous%20TimeDivision%20Multiplexing.JPG)

![TypesTDM](https://userscontent2.emaze.com/images/72e3aebb-df55-4bc6-9cd7-3d752ce861dd/3d41f635c2185898ecf9c01cc51db09a.jpg)

### Switching (Comutação)

[Link](https://www.javatpoint.com/computer-network-switching-techniques)

There are three types of switching techniques:

1. **Circuit Switching**
    - Establishes a dedicated path between sender and receiver.
    - Once the connection is established then the dedicated path will remain active until the connection is terminated.
    - A complete end-to-end path must exist before the communication takes place.
    - A request signal is sent to the receiver who then sends back the acknowledgment to ensure the availability of the dedicated path.
    - After receiving the acknowledgment, dedicated path transfers the data.

![circuitswitching](https://cdn.comparitech.com/wp-content/uploads/2019/03/Circuit-Switching-1024x427.jpg)

2. **Message Switching**
    - A message is transferred as a complete unit and routed through intermediate nodes at which it is stored and forwarded.
    - There is no establishment of a dedicated path between the sender and receiver.
    - The destination address is appended to the message.
    - Provides a dynamic routing as the message is routed through the intermediate nodes based on the information available in the message.
    - Provides the most efficient routes.
    - Each and every node stores the entire message and then forward it to the next node. This type of network is known as **store and forward network**.

![messageswitching](https://digitalnoteshub.com/wp-content/uploads/2020/12/Message-switching-1024x576.png)

3. **Packet Switching**
    - The message is sent in one go, but it is divided into smaller pieces called **packets**, and they are sent individually (and out of order).
    - Every packet contains some information in its headers such as source address, destination address and sequence number (to identify their order).
    - Packets will travel across the network, taking the shortest path as possible.
    - All packets are reassembled at the receiving end in correct order.

![packetswitching](https://cdn.comparitech.com/wp-content/uploads/2019/03/packet-switching-1024x427.jpg)

Comparison table:

![switching](/assets/images/switching.png)


# Summary

- The physical layer is the basis of all networks.

- Nature imposes two fundamental limits on all channels, and these determine their bandwidth.

- **Transmission media can be guided or unguided**.
    - The principal guided media are twisted pair, coaxial cable, and fiber optics.
    - Unguided media include terrestrial radio, microwaves, infrared, lasers through the air, and satellites.

- **Digital modulation methods** send bits over guided and unguided media as analog signals.

- Line codes operate at **baseband**, and signals can be placed in a **passband** (broadband) by modulating the amplitude, frequency, and phase of a carrier.

- Channels can be shared between users with **time, frequency, and code division multiplexing**.

- A key element in many wide area networks is the telephone system.
    - **Multiplexing with WDM** to provision many high capacity links over individual fibers
    - **Multiplexing with TDM** to share each high rate link between users.
    - Both **circuit switching** and **packet switching** play a role.

- Another system for network access is the **cable infrastructure**, which has grad- ually evolved from **coaxial cable** to **hybrid fiber coax**, where many cable Internet service providers now offer subscribers up to 1 Gbps.

- **Mobile phones** are currently in widespread use for voice and data; since 4G, all voice is, in fact, carried over a packet-switched network.
    - The first generation, 1G, was analog and dominated by AMPS.
    - 2G was digital, with GSM presently the most widely deployed mobile phone system in the world.
    - 3G is digital and based on broadband CDMA.
    - 4G’s main innovation was to shift to a packet-switched core.
    - 5G is defined by smaller cell sizes, massive MIMO, and the use of significantly more spectrum.