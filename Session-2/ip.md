# ip address
- 192.168.1.0/24
- /24 means: 24 bit used for network
- so thereofore 32-24= 8, hence 8 bits are used for host
- ipv4 is having 32 bits

# How many ips in /24
- 2^8 = 256 total ips are available
- out of which usable ips are: 256-2= 254
- 1 Network ip, i Broadcast ip
- 192.168.1.0-> Network Address
- 192.168.1.255-> Broadcast Address
- so Usable ips are in range from 192.168.1.1 to 192.168.1.254
- if you have ONE CIDR, the Total number of IPS it Covers is:
- Number of IPs = 2^(32 - CIDR)
# Example /24
- Ips= 2^(32-24)
- Ips= 2^8=256

# Example /26
- Ips= 2^(32-26)
- Ips= 2^6=64

# Example /30
- Ips= 2^(32-30)
- Ips= 2^2=4
# Example /32
- Ips= 2^(32-32)
- Ips= 2^0=1
# Example: suppose i have 1 jump server and i have to check if for provided cidr range my jump server is included or not ?

- Jump Server Ip:  192.168.1.70
- CIDR Range: 192.168.1.64/26
- Available IPS: 
    - Ips= 2^(32-26)
    - Ips= 2^6=64
- so the Network Address= 192.168.1.64
- Broadcast Address: Network + Blocksize - 1
- Broadcast Address: 65+64-1= 127
- Therefore Broadcast Address is : 192.168.1.127
- so Available ips are: 192.168.1.66 to 192.168.1.126
- 65<= 70 <= 126
- Jump Server Ip:  192.168.1.70 is available
- Answer : yes jump server is Included

# What is IP Addressing ?
- it is defining how ip address are divided into network and host part so that
    - devices can be uniquely identified
    - Routing can heppen efficiently
- There are two Approches:
    - 1. classful Addressing (OLD)
    - 2. Classless Addressing / CIDR (Modern)

