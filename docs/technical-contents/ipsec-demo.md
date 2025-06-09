# IPSec Demonstration

A demonstration and explanation of IPSec, covering its use for securing IP communications by authenticating and encrypting each IP packet in a communication session.

---

## Step 1: Lab Setup Overview

**Objective:** Create an IPsec tunnel between two Linux machines (e.g., Machine A and Machine B) behind the same home router using StrongSwan. Capture and analyze the traffic to understand IPsec's inner workings.

**Topology:**

- Machine A: 192.168.40.60 (acts as IPsec peer 1)
- Machine B: 192.168.40.100 (acts as IPsec peer 2)
- Virtual subnets (for testing):
  - Machine A: 10.10.1.0/24
  - Machine B: 10.10.2.0/24
- IPsec mode: Tunnel mode (to simulate a site-to-site VPN).

---

## Step 2: Install StrongSwan

Install StrongSwan on both machines:

```bash
sudo apt update
sudo apt install strongswan strongswan-pki libcharon-extra-plugins
```

Verify Installation:
```bash
sudo systemctl status strongswan
```
Ensure the service is running. If not, start it:
```bash
sudo systemctl start strongswan
sudo systemctl enable strongswan
```

---

## Step 3: Configure IPsec with StrongSwan

We'll configure a site-to-site IPsec tunnel using pre-shared keys (PSK) for simplicity. You can later experiment with certificates for a more secure setup.

### On Machine A (192.168.40.60)

Edit `/etc/ipsec.conf`:

```bash
sudo vi /etc/ipsec.conf
```

Add the following configuration:

```conf
config setup
    charondebug="ike 2, knl 2, cfg 2"

conn site-to-site
    left=192.168.40.60
    leftsubnet=10.10.1.0/24
    right=192.168.40.100
    rightsubnet=10.10.2.0/24
    type=tunnel
    authby=psk
    keyexchange=ikev2
    ike=aes256-sha256-modp2048
    esp=aes256-sha256
    auto=start
```

Set Pre-Shared Key in `/etc/ipsec.secrets`:

```bash
sudo vi /etc/ipsec.secrets
```

Add:

```conf
192.168.40.60 192.168.40.100 : PSK "your-secure-key-here"
```

NOTE: Replace `"your-secure-key-here"` with a strong key (e.g., a 32-character random string).

Create a virtual subnet for testing:

```bash
sudo ip link add dummy0 type dummy
sudo ip addr add 10.10.1.1/24 dev dummy0
sudo ip link set dummy0 up
```

Restart StrongSwan:

```bash
sudo ipsec restart
```

### On Machine B (192.168.40.100)

Repeat the same steps on Machine B (192.168.40.100) and configure the ipsec.conf and ipsec.secrets file with the following configuration:

Update the IP address and subnet configuration to the `/etc/ipsec.conf` file:

```conf
conn site-to-site
    left=192.168.40.100
    leftsubnet=10.10.2.0/24
    right=192.168.40.60
    rightsubnet=10.10.1.0/24
    ...
```

Update the IP address configuration to the `/etc/ipsec.secrets` file:

```conf
192.168.40.100 192.168.40.60 : PSK "your-secure-key-here"
```

Restart StrongSwan:

```bash
sudo ipsec restart
```

---

## Install dummy interface

Check if the dummy driver is installed:

```bash
root@ubuntu:/home/ubuntu# lsmod | grep dummy
root@ubuntu:/home/ubuntu# ip link add dummy0 type dummy
Error: Unknown device type.
root@ubuntu:/home/ubuntu# modprobe dummy
modprobe: FATAL: Module dummy not found in directory /lib/modules/5.15.0-1034-raspi
```

Install the dummy driver:

```bash
sudo apt install linux-modules-extra-$(uname -r)
```

Load the dummy driver:

```bash
root@ubuntu:/home/ubuntu# modprobe dummy
root@ubuntu:/home/ubuntu# lsmod | grep dummy
dummy                  20480  0
```

Add a dummy interface and set the IP address:

```bash
root@ubuntu:/home/ubuntu# ip link add dummy0 type dummy
root@ubuntu:/home/ubuntu# sudo ip addr add 10.10.1.1/24 dev dummy0
root@ubuntu:/home/ubuntu# sudo ip link set dummy0 up
root@ubuntu:/home/ubuntu# ifconfig dummy0
dummy0: flags=195<UP,BROADCAST,RUNNING,NOARP>  mtu 1500
        inet 10.10.1.1  netmask 255.255.255.0  broadcast 0.0.0.0
        inet6 fe80::8432:6aff:feb6:2b5b  prefixlen 64  scopeid 0x20<link>
        ether 86:32:6a:b6:2b:5b  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1  bytes 70 (70.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

---

##  Verify the IPsec Tunnel

Check the status of the IPsec tunnel:

```bash
ubuntu@ubuntu:~$ sudo ipsec restart
Stopping strongSwan IPsec failed: starter is not running
Starting strongSwan 5.9.5 IPsec [starter]...
ubuntu@ubuntu:~$ sudo ipsec status
Security Associations (1 up, 0 connecting):
site-to-site[1]: ESTABLISHED 29 seconds ago, 192.168.40.60[192.168.40.60]...192.168.40.100[192.168.40.100]
site-to-site{2}:  INSTALLED, TUNNEL, reqid 1, ESP SPIs: c1704a70_i cc0f5a56_o
site-to-site{2}:   10.10.1.0/24 === 10.10.2.0/24
```

You should see the site-to-site connection as ESTABLISHED.

```bash
sudo tail -f /var/log/syslog | grep charon
```

The `charondebug` settings in ipsec.conf enable verbose logging for IKE, kernel, and configuration.

Test connectivity from Machine A to Machine B:

```bash
ubuntu@ubuntu:~$ ping 10.10.2.1 -c 3
PING 10.10.2.1 (10.10.2.1) 56(84) bytes of data.
64 bytes from 10.10.2.1: icmp_seq=1 ttl=64 time=0.489 ms
64 bytes from 10.10.2.1: icmp_seq=2 ttl=64 time=0.358 ms
64 bytes from 10.10.2.1: icmp_seq=3 ttl=64 time=0.384 ms

--- 10.10.2.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2042ms
rtt min/avg/max/mdev = 0.358/0.410/0.489/0.056 ms
```

From Machine B, ping the virtual subnet on Machine A:

```bash
ubuntu@ubuntu:~$ ping 10.10.1.1 -c 3
PING 10.10.1.1 (10.10.1.1) 56(84) bytes of data.
64 bytes from 10.10.1.1: icmp_seq=1 ttl=64 time=0.455 ms
64 bytes from 10.10.1.1: icmp_seq=2 ttl=64 time=0.399 ms
64 bytes from 10.10.1.1: icmp_seq=3 ttl=64 time=0.389 ms

--- 10.10.1.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2025ms
rtt min/avg/max/mdev = 0.389/0.414/0.455/0.029 ms
```

---

**What to look for in the IPsec tunnel:**

- **IKEv2 packets (UDP port 500 or 4500):** Used for the initial key exchange and authentication. Look for:
  - IKE_SA_INIT: Initial exchange to establish the IKE Security Association (SA).
  - IKE_AUTH: Authentication phase using the pre-shared key.
- **ESP packets:** After the tunnel is established, traffic between 10.10.1.0/24 and 10.10.2.0/24 will be encapsulated in Encapsulating Security Payload (ESP) packets. These will appear as encrypted payloads between 192.168.40.60 and 192.168.40.100.

**Filter in Wireshark:**
- `ip.src == 192.168.40.60 && ip.dst == 192.168.40.100` for traffic from A to B.
- `isakmp` for IKEv2 packets.
- `esp` for ESP packets.

---

## Step 5: Understanding IPsec Protocol

IPsec is a suite of protocols for securing IP communications. Here's a breakdown of what you'll observe and learn:

**Key Components:**

- **IKE (Internet Key Exchange):** Negotiates Security Associations (SAs) for IPsec.
  - **Phase 1 (IKE_SA_INIT):** Establishes a secure channel using Diffie-Hellman for key exchange, agrees on encryption (e.g., AES256) and integrity (e.g., SHA256) algorithms.
  - **Phase 2 (IKE_AUTH):** Authenticates peers (using PSK in this case) and sets up the IPsec SA for data transfer.
- **ESP (Encapsulating Security Payload):** Encrypts and authenticates the actual data (e.g., your ping packets). In tunnel mode, the entire IP packet is encrypted and encapsulated in a new IP packet.
- **AH (Authentication Header):** Provides authentication but not encryption (not used in this setup).

**What you'll see in Wireshark:**

- **IKEv2 Negotiation:** Look for UDP packets on port 500. These contain proposals for encryption algorithms, Diffie-Hellman public keys, and nonces.
- **ESP Traffic:** Encrypted packets with no readable payload. The ESP header includes a Security Parameter Index (SPI) to identify the SA and a sequence number to prevent replay attacks.
- **No plaintext data:** Since ESP encrypts the original IP packet (e.g., ICMP pings from 10.10.1.1 to 10.10.2.1), you won't see the original packet details in the capture.

**Key Parameters in the Config:**

- `ike=aes256-sha256-modp2048`: Specifies AES-256 encryption, SHA-256 hashing, and 2048-bit Diffie-Hellman group for IKE.
- `esp=aes256-sha256`: Specifies AES-256 encryption and SHA-256 authentication for the ESP tunnel.
- `type=tunnel`: Uses tunnel mode, encapsulating the entire IP packet.