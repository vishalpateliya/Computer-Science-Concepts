# Networking Concepts

## Index

1. [ISO/OSI Stack](#1-isoosi-stack)
2. [LAN Technologies](#2-lan-technologies)
   - [Ethernet](#ethernet)
   - [Token Ring](#token-ring)
3. [TCP/UDP](#3-tcpudp)
4. [IP](#4-ip)
5. [Switches, Gateways, and Routers](#5-switches-gateways-and-routers)
   - [Switches](#switches)
   - [Gateways](#gateways)
   - [Routers](#routers)
6. [Application Layer Protocols](#6-application-layer-protocols)
   - [DNS](#dns)
   - [SMTP/POP3](#smtppop3)
   - [FTP](#ftp)
   - [HTTP](#http)
7. [Firewalls](#7-firewalls)

---

## 1. ISO/OSI Stack


## 2. LAN Technologies

### Ethernet

### Token Ring

## 3. TCP/UDP

## 4. IP (Internet Layer / Network Layer)

The IP layer is responsible for logical addressing, routing, and delivering packets end-to-end across interconnected networks. It provides a best-effort, connectionless service using IP packets (datagrams) and works closely with ICMP for errors and diagnostics.

### Overview & Role

**Primary Responsibilities:**
- **Logical Addressing:** IP addresses identify source and destination hosts across different networks
- **Routing & Forwarding:** Selecting next hops and moving packets across multiple routers
- **Best-Effort Delivery:** No guarantees of reliability, ordering, or congestion control (handled by upper layers like TCP if needed)

**Key Protocols at this Layer:**

| Protocol | Purpose |
|----------|---------|
| IPv4 / IPv6 | Internet Protocol for addressing and routing |
| ICMP | Error reporting and diagnostics |
| ARP/ND | Mapping IP to MAC addresses (link-layer helper) |

---

### IP Addressing

#### IPv4 Address Format

An IPv4 address is a 32-bit number, typically written as dotted decimal notation:

**Example:** `192.168.10.5`

**Conceptual Structure:**
- **Network part:** Identifies the network/subnet
- **Host part:** Identifies a host within that network

**Example Breakdown:**
```
Address: 192.168.10.5
Mask: 255.255.255.0 (/24)
Network: 192.168.10.0
Host range: 192.168.10.1–192.168.10.254
Broadcast: 192.168.10.255
```

#### CIDR (Classless Inter-Domain Routing) Notation

CIDR uses `/` to indicate how many leading bits represent the network:

| CIDR | Network Bits | Host Bits | Network Addresses |
|------|-------------|-----------|-------------------|
| /8 | 8 | 24 | 256² × 256 |
| /16 | 16 | 16 | 256 × 256 |
| /24 | 24 | 8 | 256 |
| /32 | 32 | 0 | 1 (single host) |

**Host Count Formula:**

- **Total addresses:** $2^{(32-\text{prefix})}$
- **Usable hosts (unicast subnets):** $2^{(32-\text{prefix})} - 2$ (network and broadcast reserved)

**Example:** `/26` subnet
- Host bits = 6 → $2^6 = 64$ total addresses
- Usable hosts = 62

#### Classful Addressing (Historical Reference)

Though legacy, classful addressing is still useful for understanding:

| Class | Range | Default Prefix | Size |
|-------|-------|-----------------|------|
| A | 0.0.0.0–127.255.255.255 | /8 | Large networks |
| B | 128.0.0.0–191.255.255.255 | /16 | Medium networks |
| C | 192.0.0.0–223.255.255.255 | /24 | Small networks |
| D | 224.0.0.0–239.255.255.255 | N/A | Multicast |
| E | 240.0.0.0–255.255.255.255 | N/A | Reserved |

**Note:** Modern networks use CIDR instead of strict classful addressing.

#### Special IPv4 Address Types

| Address Range | Type | Purpose |
|----------------|------|---------|
| 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 | Private (RFC 1918) | Not routed on public Internet |
| 127.0.0.0/8 | Loopback | Local host testing (127.0.0.1) |
| 169.254.0.0/16 | Link-Local (APIPA) | Auto-assigned when DHCP unavailable |
| 255.255.255.255 | Limited Broadcast | Local network broadcast |
| x.x.x.255 | Subnet Broadcast | Broadcast within subnet |

---

### Subnetting

Subnetting splits a larger network into smaller logical subnets by borrowing host bits for the network portion.

#### Subnetting Procedure

**Example 1: Create 4 equal subnets from 192.168.1.0/24**

1. **Required network bits:** $2^2 = 4$ subnets → need 2 bits
2. **Borrow from host bits:** /24 → /26
3. **Block size:** $256 - 192 = 64$ addresses per subnet

**Resulting subnets:**

| Subnet | Network | Usable Hosts | Broadcast |
|--------|---------|--------------|-----------|
| 1 | 192.168.1.0/26 | .1–.62 | .63 |
| 2 | 192.168.1.64/26 | .65–.126 | .127 |
| 3 | 192.168.1.128/26 | .129–.190 | .191 |
| 4 | 192.168.1.192/26 | .193–.254 | .255 |

#### Host-Oriented Subnetting

**Example 2: From 10.0.0.0/8, create subnets for ~1000 hosts each**

1. **Minimum host bits:** $2^{10} = 1024$ addresses
2. **Usable hosts per subnet:** ~1022
3. **Resulting prefix:** 32 - 10 = /22 (255.255.252.0)
4. **Number of /22 subnets in /8:** $2^{(22-8)} = 2^{14} = 16,384$ possible subnets

---

### IP Packet Structure & Encapsulation

#### IPv4 Packet (Datagram) Header

An IPv4 packet consists of a header (20–60 bytes) plus payload.

**Key Header Fields:**

| Field | Size | Purpose |
|-------|------|---------|
| **Version** | 4 bits | IP version (4 for IPv4) |
| **IHL** (Header Length) | 4 bits | Header length in 32-bit words (5 → 20 bytes minimum) |
| **DSCP/ECN** | 8 bits | Quality of Service (QoS) and congestion notification |
| **Total Length** | 16 bits | Complete packet size (header + data) in bytes |
| **Identification** | 16 bits | Identifies fragments of the same datagram |
| **Flags** | 3 bits | DF (Don't Fragment), MF (More Fragments), Reserved |
| **Fragment Offset** | 13 bits | Position of fragment in original datagram (in 8-byte units) |
| **TTL** (Time to Live) | 8 bits | Max hops; decremented at each router; dropped if 0 |
| **Protocol** | 8 bits | Next-layer protocol (6=TCP, 17=UDP, 1=ICMP) |
| **Header Checksum** | 16 bits | Checksum of IP header only |
| **Source Address** | 32 bits | IP address of sender |
| **Destination Address** | 32 bits | IP address of recipient |
| **Options** | 0–40 bytes | Optional; rarely used in modern networks |

**Example:** A typical HTTP/TCP/IP packet over Ethernet:
```
Ethernet frame → IPv4 packet (protocol=6) → TCP segment (port 80/443) → HTTP data
```

#### Encapsulation in the Stack

**Sending Data (Down the Stack):**
1. **Application layer:** Creates data (e.g., HTTP request)
2. **Transport layer:** Adds ports, sequence numbers, checksums
3. **IP layer:** Encapsulates into IP packet with source/destination IP, TTL
4. **Link layer:** Wraps into frame (e.g., Ethernet) with MAC addresses

**Receiving Data (Up the Stack):**
Each layer strips its header and passes the payload to the next layer.

---

### Routing Concepts & IP Forwarding

#### Routing vs Forwarding

| Term | Definition |
|------|-----------|
| **Routing** | Building and maintaining routing tables using routing protocols or static configuration |
| **Forwarding** | Using the routing table to choose the next hop and send packets |

Routers operate at the IP layer with multiple interfaces in different subnets. They forward packets based on IP addresses, not MAC addresses.

#### IP Forwarding Steps

When a router receives an IP packet:

1. **Verify integrity and TTL**
   - If TTL = 0, drop packet and send ICMP Time Exceeded
   
2. **Lookup destination IP**
   - Examine destination address
   
3. **Longest Prefix Match**
   - Search routing table for most specific (longest) matching route
   
4. **Determine next hop**
   - Identify outgoing interface and next-hop router IP
   
5. **Forward packet**
   - Decrement TTL
   - Recompute header checksum
   - Send packet

#### Types of Routes

| Route Type | Source | Example |
|-----------|--------|---------|
| **Directly Connected** | Local interfaces | Subnets on router's own interfaces |
| **Static Routes** | Administrator configuration | Manual entries for specific destinations |
| **Dynamic Routes** | Routing protocols | OSPF, BGP, RIP, EIGRP |

**Longest Prefix Match Example:**

Router's routing table:
```
0.0.0.0/0 → default gateway
10.0.0.0/8 → ISP A
10.1.0.0/16 → Data center
```

For destination `10.1.5.20`:
- Matches /8 ✓ and /16 ✓
- **Choose /16** (longer, more specific)

---

### IP Fragmentation & MTU

#### MTU and Fragmentation Need

**MTU (Maximum Transmission Unit):** Maximum payload size of a link-layer frame.

If an IP packet exceeds the outgoing interface MTU, IPv4 may fragment it into smaller packets.

**Example:**
```
Ethernet MTU = 1500 bytes (typical)
IP header = 20 bytes, TCP header = 20 bytes
Max TCP payload = 1500 - 20 - 20 = 1460 bytes
```

#### Fragmentation Fields & Rules

**Fields Used:**
- **Identification:** Same value for all fragments of the original datagram
- **DF (Don't Fragment):** If set, routers must not fragment; instead drop and send ICMP
- **MF (More Fragments):** Set on all fragments except the last
- **Fragment Offset:** Where this fragment's data starts (in units of 8 bytes)

**Rules:**
- Fragment data must be a multiple of 8 bytes (except final fragment)
- Each fragment gets its own IP header
- Total Length reflects individual fragment size

#### Fragmentation Example

**Scenario:**
- Original datagram: 4000 bytes total (20-byte IP header + 3980 bytes data)
- Outgoing link MTU: 1500 bytes
- Max data per fragment: 1480 bytes (multiple of 8 ✓)

**Resulting Fragments:**

| Fragment | Data Bytes | Offset | MF |
|----------|-----------|--------|-----|
| 1 | 0–1479 (1480) | 0 | 1 |
| 2 | 1480–2959 (1480) | 185 | 1 |
| 3 | 2960–3979 (1020) | 370 | 0 |

All fragments carry the same Identification; receiver reassembles using Identification + Fragment Offset.

#### Problems with Fragmentation

| Issue | Impact |
|-------|--------|
| Fragment loss | Entire original datagram must be retransmitted |
| Increased packets | More network and host overhead |
| Mishandling | Firewalls or NAT may not process fragments correctly |

#### Path MTU Discovery (PMTUD)

**Purpose:** Determine maximum packet size that can traverse the path without fragmentation

**Process:**
1. Sender transmits packets with DF (Don't Fragment) set
2. Router cannot fragment; drops oversized packet
3. Router sends ICMP "Fragmentation Needed" with MTU size
4. Sender reduces packet size to discovered path MTU
5. No fragmentation occurs on subsequent packets

---

### ICMP (Internet Control Message Protocol)

#### Purpose & Role

ICMP is used for error reporting and diagnostic messages at the IP layer.

**Key Points:**
- Carried inside IP packets (Protocol 1 for ICMPv4, 58 for ICMPv6)
- Does NOT provide reliability for user data
- Used for network control and diagnostics only

**ICMP Message Structure:**
```
Type (8 bits) | Code (8 bits) | Checksum (16 bits) | Data
```

The Data field often includes part of the original IP header + 8 bytes of the original payload for context.

#### Common ICMP Message Types (IPv4)

| Type | Code | Name | Purpose |
|------|------|------|---------|
| 0 | 0 | Echo Reply | Response to ping request |
| 3 | 0 | Destination Unreachable (Network) | Destination network not reachable |
| 3 | 1 | Destination Unreachable (Host) | Destination host not reachable |
| 3 | 3 | Destination Unreachable (Port) | UDP/ICMP port unreachable |
| 3 | 4 | Destination Unreachable (Fragmentation Needed) | Packet too large, DF set; used by PMTUD |
| 5 | 0 | Redirect | Better gateway available for destination |
| 8 | 0 | Echo Request | Ping request; tests reachability |
| 11 | 0 | Time Exceeded (Transit) | TTL expired in transit; used by traceroute |
| 11 | 1 | Time Exceeded (Reassembly) | Fragment reassembly time limit exceeded |

#### Practical Applications

**Ping (Echo Request/Reply):**
- Sends ICMP Echo Requests
- Expects Echo Replies
- Measures reachability and round-trip time (RTT)

**Traceroute (Probing Path):**
- Sends packets with gradually increasing TTL (1, 2, 3, ...)
- Intermediate routers drop packets when TTL expires
- Each router responds with ICMP Time Exceeded
- Reveals the network path hop-by-hop

**PMTUD Scenario:**
1. Host sends 2000-byte packet with DF=1
2. Link MTU is 1500 bytes
3. Router cannot fragment (DF set); drops packet
4. Router sends ICMP Destination Unreachable, Code 4 with MTU information
5. Sender adjusts packet size to 1500 bytes

---

### IPv6 (Brief Overview)

While IPv4 dominates, IPv6 addresses the address exhaustion problem:

| Feature | IPv4 | IPv6 |
|---------|------|------|
| **Address Size** | 32 bits | 128 bits |
| **Notation** | Dotted decimal (xxx.xxx.xxx.xxx) | Colon hexadecimal (xxxx:xxxx::xxxx) |
| **Address Space** | $2^{32}$ (~4.3 billion) | $2^{128}$ (essentially unlimited) |
| **Header Size** | 20–60 bytes | 40 bytes (fixed) |
| **Fragmentation** | Routers fragment packets | Only hosts fragment packets |
| **Auto-configuration** | Manual/DHCP | Built-in (SLAAC) |

IPv6 simplifies routing, improves security (IPsec), and provides better mobility support.

---

### Summary & Key Points

✓ **IP layer** = logical addressing + routing, best-effort, connectionless service

✓ **IPv4 header fields:** Version, IHL, Total Length, Identification, Flags (DF/MF), Fragment Offset, TTL, Protocol, Header Checksum, Source/Destination IP

✓ **Subnetting:** Master CIDR notation, block size calculations, host count formulas, and network/broadcast ranges

✓ **Routing:** Longest prefix match, default route (0.0.0.0/0), static vs dynamic routing

✓ **Fragmentation:** Triggered by MTU; uses Identification, Flags, Fragment Offset; avoid with PMTUD and appropriate MSS sizing

✓ **ICMP:** Error/diagnostic only; key types: Echo (ping), Destination Unreachable, Time Exceeded (traceroute), Redirect

✓ **Tools:** `ping` tests reachability; `traceroute` reveals path; `ipconfig`/`ifconfig` shows local configuration

## 5. Switches, Gateways, and Routers

### Switches

### Gateways

### Routers

## 6. Application Layer Protocols

### DNS

#### Overview & Purpose

DNS (Domain Name System) is a distributed, hierarchical naming system that translates domain names into IP addresses. Humans remember names; computers understand IP addresses.

**Why DNS is Needed:**
- IP addresses are hard to remember
- IPs can change, but domain names remain stable
- Supports scalability and critical services (Web, Email, FTP, VoIP)

#### DNS Architecture

**Hierarchy (Top-Down):**
```
. (Root)
├── com, org, in (TLDs)
│   └── Second-Level Domains (iiita, google)
│       └── Subdomains (www, mail)
```

**Server Components:**

| Component | Role |
|-----------|------|
| **Stub Resolver** | Client-side; queries recursive resolver |
| **Recursive Resolver** | ISP/public DNS; finds complete answer; caches results |
| **Root Name Server** | References TLD servers |
| **TLD Name Server** | References authoritative servers for domains |
| **Authoritative Server** | Stores actual DNS records |

#### Resolution Process & Query Types

**Resolution Steps (Example: `www.iiita.ac.in`):**
1. Client queries recursive resolver
2. Resolver queries Root → TLD → Authoritative server
3. IP address returned and cached
4. Browser connects to server

**Query Types:**
- **Recursive:** Server returns complete answer (Client → Resolver)
- **Iterative:** Server returns referral (Resolver → Other servers)

#### DNS Records & Protocols

**Common Resource Records (RRs):**

| Record | Purpose |
|--------|---------|
| A | Domain → IPv4 |
| AAAA | Domain → IPv6 |
| CNAME | Alias mapping |
| MX | Mail server routing |
| NS | Authoritative server |
| PTR | Reverse DNS (IP → Domain) |
| SOA | Zone control information |

**Transport Protocols:**
- **UDP (Port 53):** Normal DNS queries
- **TCP (Port 53):** Zone transfers, large responses, DNSSEC

#### Security & Performance

**Caching & TTL:**
- Responses cached at multiple levels
- TTL defines cache duration
- Reduces latency and server traffic

**DNS Threats:**
- **Cache Poisoning:** Fake responses redirect users to malicious sites
- **DDoS Amplification:** Small requests generate huge responses using spoofed IPs
- **Tunneling:** DNS used to exfiltrate data, bypassing firewalls

**DNSSEC & Privacy:**
- **DNSSEC:** Digital signatures ensure authenticity and integrity (not confidentiality)
- **DoT (DNS over TLS):** Port 853; encrypted but identifiable as DNS
- **DoH (DNS over HTTPS):** Port 443; encrypted and looks like normal web traffic

### SMTP/POP3

#### Overview & Purpose

SMTP (Simple Mail Transfer Protocol) and POP3 (Post Office Protocol v3) are complementary protocols that handle email transmission and retrieval:
- **SMTP:** Sends and relays emails (push protocol)
- **POP3:** Retrieves emails from mailbox (pull protocol)

**Email Flow Architecture:**
```
MUA → SMTP → MSA/MTA → MDA → Mailbox → POP3 → MUA
```

| Component | Role |
|-----------|------|
| **MUA** | Mail User Agent (client application) |
| **MSA** | Mail Submission Agent (accepts mail from users) |
| **MTA** | Mail Transfer Agent (relays mail between servers) |
| **MDA** | Mail Delivery Agent (delivers to mailbox) |

---

#### SMTP (Simple Mail Transfer Protocol)

**Purpose:**
- Send email from client → server
- Relay email between servers (server → server)

**Ports:**
- **Port 25:** Server-to-server relay
- **Port 587:** Mail submission (preferred for clients)
- **Port 465:** SMTP over SSL (legacy)

**Command Sequence:**
```
EHLO → MAIL FROM → RCPT TO → DATA → QUIT
```

**Core Commands:**

| Command | Purpose |
|---------|---------|
| EHLO/HELO | Client identification |
| MAIL FROM | Sender address |
| RCPT TO | Recipient address |
| DATA | Message body |
| RSET | Reset session |
| QUIT | Terminate connection |

**Response Codes:**

| Code Range | Meaning | Examples |
|-----------|---------|----------|
| 2xx | Success | 250 OK, 354 Start data input |
| 3xx | Continue | Await further commands |
| 4xx | Temporary failure | Retry later |
| 5xx | Permanent failure | 550 No such mailbox |

**ESMTP Extensions:**

| Extension | Feature |
|-----------|---------|
| AUTH | Authentication (LOGIN, PLAIN, OAuth2) |
| STARTTLS | Encryption upgrade |
| SIZE | Maximum message size negotiation |

**Security Measures:**
- **Authentication:** LOGIN, PLAIN, or OAuth2
- **Encryption:** STARTTLS (upgrade connection) or SSL/TLS (port 465)
- **Anti-spam:** SPF (Sender Policy Framework), DKIM (DomainKeys Identified Mail), DMARC (Domain-based Message Authentication)

---

#### POP3 (Post Office Protocol v3)

**Purpose:**
- Retrieve emails from server mailbox
- Pull protocol (client initiates retrieval)
- Typically downloads and deletes mail from server

**Ports:**
- **Port 110:** Plain POP3
- **Port 995:** POP3 over SSL

**Connection States:**

| State | Description |
|-------|-------------|
| **Authorization** | USER/PASS login |
| **Transaction** | Mailbox operations (LIST, RETR, DELE) |
| **Update** | Deletions applied on QUIT |

**Core Commands:**

| Command | Purpose |
|---------|---------|
| USER | Username |
| PASS | Password |
| STAT | Mailbox status (message count, size) |
| LIST | List messages with sizes |
| RETR | Retrieve full message |
| DELE | Mark message for deletion |
| QUIT | Apply deletions, close connection |

**Responses:**
- **+OK:** Success
- **-ERR:** Failure

**Characteristics:**
- No folder hierarchy (single mailbox per session)
- No synchronization across devices
- Downloaded messages typically deleted from server
- Stateless protocol (no folder management)

---

#### SMTP vs POP3 Comparison

| Feature | SMTP | POP3 |
|---------|------|------|
| **Primary Role** | Send | Receive |
| **Protocol Mode** | Push | Pull |
| **Stores Mail** | No | Temporary |
| **Reads Inbox** | No | Yes |
| **Port (Standard)** | 25, 587 | 110 |
| **Port (Encrypted)** | 465 | 995 |

---

#### Email Delivery Scenarios

**Same Domain (a.com → a.com):**
- SMTP submission only
- Local delivery via MDA
- No MX lookup required

**Cross Domain (a.com → b.com):**
- SMTP submission to sender's MSA
- MX record lookup for recipient domain
- SMTP relay via port 25 to recipient's MTA
- MDA delivery to recipient mailbox

### FTP

#### Overview & Purpose

**Definition:** A standard network protocol used for the transfer of computer files between a client and server on a computer network.

**Layer:** Operates at the Application Layer (Layer 7) of the OSI Model.

**Transport Protocol:** Uses TCP (Transmission Control Protocol) for reliable delivery. It does not use UDP.

**Architecture:** Client-Server Model.

#### The "Two-Channel" Architecture

Unlike HTTP, which typically uses a single connection for headers and body, FTP uses two separate parallel TCP connections. This is known as Out-of-Band signaling:

- **Control Channel (Port 21):** Commands and responses flow here
- **Data Channel (Port 20 - Active Mode):** File transfers occur here (varies by mode)

**Key Point:** The control connection remains open for the entire session, while data connections are created and destroyed as needed.

#### Connection Modes (Crucial Concept)

The most common point of confusion in FTP is how the Data Connection is established. There are two modes:

**A. Active Mode (The "Original" Way)**

In Active mode, the client initiates the control command, but the **server initiates** the data connection back to the client.

**Sequence:**
1. Client connects to Server on Port 21 (Control Channel)
2. Client sends PORT command: "I am listening on IP A and Port N. Send data there."
3. Server initiates a connection from its Port 20 to Client's Port N

**The Problem:** Client-side firewalls often block incoming connections from the internet (the server trying to connect to the client).

---

**B. Passive Mode (PASV - The "Firewall Friendly" Way)**

In Passive mode, the **client initiates both** the control and data connections.

**Sequence:**
1. Client connects to Server on Port 21 (Control Channel)
2. Client sends PASV command: "I want to connect to you"
3. Server opens a random high port (e.g., 10245) and responds: "Okay, connect to me on Port 10245"
4. Client initiates connection to Server's Port 10245 (Data Channel)

**The Benefit:** Solves the client-side firewall issue because the client initiates outbound connections.

**Comparison Table:**

| Feature | Active Mode | Passive Mode |
|---------|------------|--------------|
| **Control Connection** | Client → Server:21 | Client → Server:21 |
| **Data Connection** | Server → Client | Client → Server |
| **Data Port** | Server Port 20 | Server Random High Port |
| **Firewall Issue** | Client-side blocks incoming | None (both outbound) |
| **Typical Use** | Legacy systems | Modern environments |

#### Data Representation Types

You must specify how the data is interpreted during transfer:

**ASCII Mode:**
- Used for text files (HTML, TXT, CSV)
- Protocol may adjust "End of Line" characters (CR/LF) to match the receiving operating system
- Example: Windows (CRLF) to Linux (LF) conversion

**Binary Mode (Image Mode):**
- Used for executables, images (JPG, PNG), archives (ZIP), audio, and video
- File is transferred bit-for-bit with no modification
- Preserves file integrity

⚠️ **Tip:** If you transfer an image in ASCII mode, it will likely be corrupted.

#### Key Commands & Status Codes

**Common Commands:**

| Command | Purpose |
|---------|---------|
| USER | Send username for authentication |
| PASS | Send password for authentication |
| LIST | Request list of files in current directory |
| RETR | Retrieve (download) file from server to client |
| STOR | Store (upload) file from client to server |
| DELE | Delete a remote file |
| CWD | Change Working Directory |
| PWD | Print Working Directory |
| MKD/RMD | Make/Remove Directory |
| QUIT | Disconnect and close session |

**Status Code Classes:**

Similar to HTTP, FTP uses 3-digit response codes:

| Code Range | Meaning | Examples |
|-----------|---------|----------|
| 2xx | Success | 200 Command okay, 226 Transfer complete |
| 3xx | Action needs more info | 331 User name okay, need password |
| 4xx | Transient/Temporary Error | 425 Can't open data connection (try again) |
| 5xx | Permanent Error | 530 Not logged in, 550 File not found |

#### Security Considerations

**Standard FTP is Insecure:**
- Username and password transmitted in clear text
- File data transmitted in plain text
- Anyone sniffing the network (using tools like Wireshark) can capture credentials and files

**Secure Alternatives:**

| Protocol | Details |
|----------|---------|
| **FTPS** (FTP Secure) | FTP over SSL/TLS encryption layer; adds security to standard FTP |
| **SFTP** (SSH File Transfer Protocol) | Completely different protocol based on SSH; runs on Port 22; generally preferred for secure file transfers |

**Note:** SFTP ≠ FTPS. They are entirely different protocols; SFTP uses SSH while FTPS wraps FTP with TLS/SSL.

#### Quick Reference Checklist

- ✓ **Ports:** Control = 21, Data = 20 (Active Mode)
- ✓ **Transport:** TCP only (Reliable)
- ✓ **Architecture:** Out-of-Band (Control and Data on separate channels)
- ✓ **Active Mode:** Server connects to Client (firewall-unfriendly)
- ✓ **Passive Mode:** Client connects to Server (firewall-friendly)
- ✓ **Data Modes:** ASCII (text) vs Binary (all other files)
- ✓ **Security:** Standard FTP sends passwords in clear text; use FTPS or SFTP for security

### HTTP

#### Overview & Purpose

**Definition:** HTTP (Hypertext Transfer Protocol) is the foundation of data communication on the World Wide Web. It is an Application Layer protocol used to transfer hypermedia documents such as HTML, JSON, images, and videos.

#### Core Concepts

**1. Client–Server Model**

HTTP follows a request–response model:
- **Client:** Initiates the request (Web browser, mobile app, curl, Postman, etc.)
- **Server:** Hosts resources and sends responses (Apache, Nginx, IIS, Node.js, etc.)

**2. Stateless Protocol**

HTTP is stateless, meaning:
- Each request is independent
- The server does not remember previous requests
- State is simulated using:
  - Cookies
  - Sessions
  - Tokens (JWT, OAuth)
  - LocalStorage (client-side)

#### HTTP Communication Flow

```
1. Client resolves the server's IP (via DNS)
2. Client opens a TCP connection (or QUIC for HTTP/3)
3. Client sends an HTTP Request
4. Server processes the request
5. Server sends an HTTP Response
6. Connection is closed or reused (Keep-Alive)
```

#### Anatomy of an HTTP Request

An HTTP request has three parts:

**1. Start Line (Request Line)**
```
METHOD /path HTTP/version
```
Example: `GET /api/users HTTP/1.1`

**2. Headers**

Key–value pairs with metadata:
```
Host: example.com
User-Agent: Mozilla/5.0
Accept: application/json
```

**3. Body (Optional)**

Used mainly with POST, PUT, PATCH:
```json
{
  "username": "john",
  "password": "1234"
}
```

#### Anatomy of an HTTP Response

An HTTP response also has three parts:

**1. Status Line**
```
HTTP/version Status-Code Status-Message
```
Example: `HTTP/1.1 200 OK`

**2. Headers**

Metadata about response:
```
Content-Type: application/json
Content-Length: 85
```

**3. Body**

Actual resource returned:
```json
{
  "id": 1,
  "name": "John"
}
```

#### HTTP Methods (Verbs)

HTTP methods define the action to be performed on a resource:

| Method | Description | Safe | Idempotent |
|--------|-------------|------|-----------|
| GET | Retrieve data | ✅ | ✅ |
| HEAD | Same as GET, no body | ✅ | ✅ |
| POST | Create resource | ❌ | ❌ |
| PUT | Replace resource | ❌ | ✅ |
| PATCH | Partial update | ❌ | ❌ |
| DELETE | Remove resource | ❌ | ✅ |
| OPTIONS | Supported methods | ✅ | ✅ |

**Definitions:**
- **Safe:** Does not modify server state
- **Idempotent:** Multiple identical requests → same result

#### HTTP Status Codes

Status codes are 3-digit numbers indicating the result:

**Categories:**

| Code Range | Meaning |
|-----------|---------|
| 1xx | Informational |
| 2xx | Success |
| 3xx | Redirection |
| 4xx | Client Error |
| 5xx | Server Error |

**Common Examples:**

| Code | Meaning |
|------|---------|
| 200 | OK – Successful request |
| 201 | Created – Resource created |
| 301 | Moved Permanently – Redirect |
| 400 | Bad Request – Invalid request |
| 401 | Unauthorized – Authentication required |
| 403 | Forbidden – Access denied |
| 404 | Not Found – Resource not found |
| 500 | Internal Server Error – Server failure |

#### HTTP Headers

Headers carry metadata about requests and responses:

**General Headers (Both Request & Response):**
- Date
- Connection: keep-alive
- Cache-Control

**Request Headers:**
- User-Agent → Client info
- Accept → Expected response format
- Authorization → Credentials/token
- Cookie → Stored client state

**Response Headers:**
- Server → Server software
- Set-Cookie → Store data on client
- WWW-Authenticate → Auth challenge

**Entity (Representation) Headers:**
- Content-Type → MIME type
- Content-Length → Size in bytes
- Content-Encoding → gzip, br
- ETag → Resource versioning

#### HTTPS & Security

**HTTPS (HTTP Secure)**

- HTTP is plain text → vulnerable to attacks
- HTTPS = HTTP over TLS/SSL

**Benefits:**
- 🔒 **Encryption** – Prevents eavesdropping
- 🛡 **Integrity** – Prevents tampering
- ✅ **Authentication** – Verifies server identity
- Uses X.509 Certificates issued by Certificate Authorities (CA)

#### HTTP Protocol Versions

**HTTP/1.1**
- Text-based
- Persistent connections (Keep-Alive)
- One request per connection (head-of-line blocking)

**HTTP/2**
- Binary protocol
- Multiplexing (multiple requests per connection)
- Header compression (HPACK)
- Faster and more efficient

**HTTP/3**
- Built on QUIC (UDP)
- Faster handshake
- No TCP head-of-line blocking
- Better for mobile & unstable networks

#### Example: Complete HTTP Interaction

**Request:**
```
GET /users/1 HTTP/1.1
Host: api.example.com
Accept: application/json
Authorization: Bearer abc123
```

**Response:**
```
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 52

{
  "id": 1,
  "name": "Alice",
  "email": "alice@example.com"
}
```

#### Summary

- HTTP is stateless, client-server, and request-response
- Uses methods, headers, and status codes
- HTTPS adds security via TLS/SSL
- HTTP/2 and HTTP/3 improve performance

## 7. Firewalls

### Introduction

#### What is a Firewall?

A firewall is a security device (hardware, software, or virtual) that:
- Monitors and controls network traffic
- Enforces security rules/policies
- Controls Ingress (incoming) and Egress (outgoing) traffic

Its primary goal is to allow legitimate traffic and block unauthorized or malicious traffic.

---

### Understanding the Core Concepts

#### The "Traffic Cop" Analogy

A firewall acts like a traffic cop at a checkpoint, deciding:
- Which traffic is allowed
- Which traffic is blocked

#### Types of Traffic

- **Ingress Traffic:** Data coming into your network (Example: Downloading a webpage from the internet)
- **Egress Traffic:** Data going out of your network (Example: Sending an email or uploading a file)

**Example Flow:**
```
Internet → Your PC = Ingress
Your PC → Internet = Egress
```

---

### Where Do Firewalls Sit?

| Firewall Type | Location | Purpose |
|---------------|----------|---------|
| **Perimeter Firewall** | Network edge (Internet gateway) | Protects entire internal network from external threats |
| **Internal (Segmentation) Firewall** | Inside large networks | Separates departments, zones, or security levels (e.g., HR vs IT) |
| **Host-Based Firewall** | Individual systems | Example: Windows Defender Firewall, iptables |

---

### Key Firewall Concepts

**Rules / Policies:**
Define what traffic is allowed or denied

**Default Deny Principle:**
Block everything unless explicitly allowed

**Stateful vs Stateless:**
- **Stateless:** Each packet evaluated independently
- **Stateful:** Tracks connection state and allows return traffic automatically

---

### Types of Firewalls

#### 1. Packet-Filtering Firewalls (First Generation)

**How It Works:**
Examine basic packet information: Source/Destination IP, Port number, Protocol

**Analogy:** Simple bouncer checking IDs

| Pros | Cons |
|------|------|
| Fast and efficient | No connection tracking |
| Simple to configure | Vulnerable to IP spoofing |
| Low cost | No application awareness |

#### 2. Stateful Inspection Firewalls (Second Generation)

**How It Works:**
- Maintain a state table
- Track active connections
- Automatically allow legitimate return traffic

**Analogy:** Bouncer who remembers who entered

| Pros | Cons |
|------|------|
| More secure than packet filters | More complex |
| Efficient handling of established connections | Limited visibility into application-layer data |

#### 3. Proxy Firewalls (Application-Level Gateways – Third Generation)

**How It Works:**
- Act as an intermediary between client and server
- Inspect traffic at the application layer (Layer 7)

**Analogy:** Concierge who receives, inspects, and forwards requests

| Pros | Cons |
|------|------|
| Deep packet inspection | Higher latency |
| Application-aware filtering | Application-specific configuration required |
| Hides internal network details | |

#### 4. Next-Generation Firewalls (NGFWs)

**How It Works:**
Combine traditional firewall capabilities with:
- Intrusion Prevention System (IPS)
- Application control
- User awareness
- Threat intelligence
- SSL/TLS inspection

**Analogy:** Intelligent security system with behavior analysis

| Pros | Cons |
|------|------|
| Strong protection against modern threats | Higher cost |
| Granular control and visibility | Resource-intensive |
| | Increased configuration complexity |

---

### How Firewalls Work: Rules & Policies

#### The Rule Set

- Rules are processed top-down
- First matching rule is applied
- If no rule matches → Implicit Deny

#### Anatomy of a Firewall Rule

| Element | Description |
|---------|-------------|
| **Source** | IP, network, or user |
| **Destination** | IP, network, or service |
| **Protocol** | TCP, UDP, ICMP, etc. |
| **Port** | e.g., 80 (HTTP), 443 (HTTPS), 22 (SSH) |
| **Action** | Allow / Deny / Reject / Drop |

**Action Types:**
- **Allow:** Permit traffic
- **Deny/Reject:** Block and send notification
- **Drop:** Block silently with no response

#### Practical Examples (Cisco ASA Syntax)

**Rule 1: Allow external users to access an internal web server (192.168.1.100)**
```
access-list OUTSIDE_IN extended permit tcp any host 192.168.1.100 eq www
access-list OUTSIDE_IN extended permit tcp any host 192.168.1.100 eq https
access-group OUTSIDE_IN in interface outside
```

**Rule 2: Allow incoming SSH to a specific internal server (192.168.1.50)**
```
access-list OUTSIDE_IN extended permit tcp any host 192.168.1.50 eq ssh
access-group OUTSIDE_IN in interface outside
```

**Rule 3: Deny all traffic from a known malicious IP (203.0.113.5)**
```
access-list OUTSIDE_IN extended deny ip host 203.0.113.5 any
access-group OUTSIDE_IN in interface outside
```

**Implicit Deny Reminder:**
Any traffic not explicitly permitted by an access-list is automatically blocked.

---

### Importance of Firewall Management

- **Regular rule review** prevents security gaps
- **Remove unused or outdated rules** reduces complexity and potential vulnerabilities
- **Keep firmware and signatures updated** ensures protection against new threats
- **Monitor logs for suspicious activity** enables early detection of attacks

---

### Benefits & Limitations

#### Key Benefits

| Benefit | Description |
|---------|-------------|
| **Access Control** | Blocks unauthorized access |
| **Threat Protection** | Mitigates scans, DoS, basic malware |
| **Policy Enforcement** | Enforces organizational security rules |
| **Logging & Auditing** | Enables traffic analysis and forensics |

#### Limitations

**General Limitations:**
- **Not a Silver Bullet:** One layer in defense-in-depth strategy
- **Insider Threats:** Limited protection against trusted users
- **Advanced Attacks:** APTs (Advanced Persistent Threats) and zero-days may bypass controls
- **Misconfiguration Risk:** Incorrect rules can expose networks

**Does NOT Protect Against:**
- Malware inside allowed traffic
- Phishing attacks
- Social engineering
