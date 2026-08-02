# Day 15 - Networking Concepts: DNS, IP, Subnets & Ports 
## Task 1: DNS - How Names Become IPs
* The Domain Name System (DNS) is the internet's phonebook. It translates the human readable website names (e.g. google.com) into
  machine-readable numeric IP Addresses (`142.251.142.238`) and allow our browser to load the website using this numeric IP.  

1. What happens when you type `google.com` in your browser?
   * When we enter `google.com` in our web browser, browser checks its cache for any stored IP address.
   * If, it's not there in cache, the request is sent to DNS resolver.
   * Then, DNS resolver query the root server, which points to the correct Top Level Domain (TLD) server (in this case `.com`).
   * The TLD server direct resolver to the domain's authorativer server.
   * The authorative server returns the actual IP address to the resolver & this response (IP Address) send to the browser, for connecting securally to `google.com`.
    
2. What are these record types? Write one line each:
   * A : Maps a domain name to an IPv4 address.
   * AAAA : Maps a domain name to an IPv6 address.
   * CNAME (Canonical Name): CNAME is another alias for a domain name (For e.g. `www.google.com` points to `google.com`)
   * MX (Mail Exchange) : Direct email to the specific mail server.
   * NS (Name Server) : Points to the DNS server for the domain
   * TXT (Text) : Store text information for email security.
     
3. Run: `dig google.com` - identify the A record and TTL from the output
   * Column 4 in the output ANSWER SECTION, shows 'A' record with IPv4 address (142.251.142.238).
   * And, TTL (Time To Live) is 127 ms (i.e. DNS resolvers cache this record for 127 seconds)

Snapshot:

<img width="559" height="287" alt="image" src="https://github.com/user-attachments/assets/827a7af1-587c-4894-adc5-3e7393805cc4" />

## Task 2: IP Addressing
1. What is an IPv4 address? How is it structured? (e.g., 192.168.1.10)
   * An IPv4 address is a numeric 32-bit unique address allocated for every device that conencted on the network/internet.
   * It is divided into 4 parts, with basically an octet, and each part holds value from 0 to 255 with 8-bit each.
   * Generally these are normal decimal numbers between 0-255 for each octet for humans, but computers convert them into binary numbers ( 0 & 1).
   * The conversion of IP address : `192.168.1.10`

     | Octet | Deciaml | binary |
     |-------|---------|--------|
     |1|192|11000000|
     |2|168|10101000|
     |3|1|00000001|
     |4|10|00001010|
     
2. Difference between public and private IPs — give one example of each
   * **Public IP** : A unique address assigned by our Internet Service Provider (ISP) that accessible globally over the internet.
   * Example: `curl ifconfig.me` -> `13.60.19.197`
   * **Private IP** : A local address assigned by the router to devices like Mobile, laptop, etc inside our home/offices.
     This address is hidden for outside internet & used only for communication within the local area network (LAN)
   * Example: 172.31.43.xxx
     
3. What are the private IP ranges?
   * 10.0.0.0 - 10.255.255.255
   * 172.16.0.0 - 172.31.255.255
   * 192.168.0.0 - 192.168.255.255

4. Run: `ip addr show` — identify which of your IPs are private
   * My command output shows these private IPs: 172.31.43.160 (AWS EC2), 172.17.0.1 (Docker Private Bridge IP)

## Task 3: CIDR & Subnetting
1. What does /24 mean in 192.168.1.0/24?
   * `/24` or `/n` : It shows how many bits form the network. 
2. How many usable hosts in a /24? A /16? A /28?
   * Formula to caluclate usable hosts: 2^(32-n) - 2 (Because first and last IP addresses are not usable)
   * /24 : 254 usable hosts (i.e. total 256 IP Addresses)
   * /16 : 65,534 usable hosts (Total 65,536 IP Addresses)
   * /28 : 14 usable hosts (Total 16 IP Addresses)
     
3. Explain in your own words: why do we use subnet?
   * We use subnets to divide the large network into smaller logical chunks/groups of networks.
   * Using subnets it is easier to maintain network, improve network performance & security as well.
   * In the same subnet we can have a different Public & Private network.
  
4. Quick exercise — fill in:
   | CIDER | Subnet Mask | Total IPs | Usable Hosts|
   |-------|-------------|-----------|-------------|
   | /24 | 255.255.255.0 (24 bits) | 256 | 254 |
   | /16 | 255.255.0.0 (16 bits) | 65,536 | 65,534 |
   | /28 | 255.255.255.240 (28 bits) | 16 | 14|

## Task 4: Ports – The Doors to Services
1. What is a port? Why do we need them?
   * Port: A network port is the specific virtual communication endpoint that helpts to direct the data/communication to the specific application/service.
     Consider, IP Address as the address for the building then Port number is the room number.
   * Ports are represented as numbers from 0 to 65,535.
   * Using port, we can use multiple application/services without mixing them with each other by identifying the service/application based on Port.  

2. Common ports:
   | Port | Service |
   |------|---------|
   | 22 | SSH |
   | 80 | HTTP |
   | 443 | HTTPS |
   | 53 | DNS |
   | 3306 | MYSQL |
   | 6379 | Redis |
   | 27017 | MongoDb |
   | 25 | SMTP |

3. Run ss -tulpn — match at least 2 listening ports to their services
   | PORT | Service | STATE |
   |------|---------|-------|
   | 22 | SSH | LISTEN |
   | 80 | HTTP | LISTEN |
   | 53 | DNS | LISTEN |

   Snapshot:

   <img width="476" height="199" alt="image" src="https://github.com/user-attachments/assets/0cae5ea0-9525-46ee-8bbe-d1657b3fcc21" />

## Task 5: Putting It Together
1. You run curl http://myapp.com:8080 - what networking concepts from today are involved?
   1. DNS Resolver/Lookup: When I hit this command, first it checks for the URL & resolves IP, using DNS System.
   2. After DNS resolves the IP, the curl command connects the IP, whether it is public/private.
   3. Since, HTTP uses TCP protocal, it establishes TCP connection before sending the request.
   4. Since, we are using '8080' in our url, it uses specific port to connect rather than using the default HTTP '80' port.
   5. Using this we are making HTTP GET request.
      
2. Your app can't reach a database at 10.0.1.50:3306 — what would you check first?
   1. First, I check whether server is reachable to IP : 10.0.1.50 using `ping 10.0.1.50`
   2. If its reachable, then, check for firewall rule or check security group setting (on AWS EC2 server) whether Port: 3306 is open for incoming traffic.
   3. Check MySQL Service status using `systemctl status mysql`
   4. Using `ss -tulpn`, I check whether MySQL service status is actively listening on Port 3036.

## What I Learned
1. **DNS System**: From today's hands-on practice, I learned that DNS is the backbone for every network communication. Whenever, we type any url/service
   on our browser, it identify the IP address using DNS root server, TLD & Authorative service. Its not just a sending request & getting response,
   but there are multiple calls happens between different DNS services for establishing connection to the right application.
  
2. **IP Address & its Categorization** : As we know, every device in the network have a unique identification number i.e. IP Address. However, these IP addresses are
   well structured and also categorized into Public & Private for better usablity & security. Public IP Adress are reachable anywhere in the internet whereas Private
   IP Addresses can only be accessible in the Local Area Network (LAN)/Home network such  as Home/offices.

3. **Subnet & CIDR** : To enhance the security & maintenance of the network it is best practice to divide our large spread network into the smaller subnets.
   Using CIDR (Classless Inter Domain Routing) we can map the IP Address range and network mask, to allocate the IP addresses as per our requirements.

4. **Port Uses** : Using Port, it is very easy to direct the traffic to the particular service. Even, we have default ports assigned for some particular services,
   we can define our custom port nubmers to any application/service as per our need. This mainly depends on project requirement.
