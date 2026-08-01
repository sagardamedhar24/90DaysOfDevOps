# Day 14 – Networking Fundamentals & Hands-on Checks
* ## OSI Model vs TCP/IP Model
* **OSI Model**: OSI Model is a 7-layer traditional model used to standardize network communication and to understand data flow.
  The 7 layers of the OSI Model are Physical (L1), Data Link(L2), Network(L3), Transport(L4), Session(L5), Presentation (L6) & Application(L7). Each layer has its
  own uses and boundaries in the network communication.
* **TCP/IP Model**: TCP/IP model is a practical and protocol driven model developed to run the actual network. It has basically 4 layers in which a 
  few layers are combined together to make a one layer. Such as the Application Layer (combined from application, presentation & session layer), Transport,
  Internet (Network layer from OSI model) & Network Access Layer (combines Physical & Data-Link Layer).

## Where IP, TCP/UDP, HTTP/HTTPS, DNS sit in the stack
  * **IP** : IP Protocol is used on Network/Internet layer to routes the data packets to destination address.
  * **TCP/UDP** : This protocols uses by Transport layer to manage the end-to-end data delivery and relibility between hosts.
  * **HTTP/HTTPS** : This sits on application layer. It manages communication between client (Web Browser) & Server.
  * **DNS** : DNS also used mostly on application layer to translate a human-readable name into IP addresses thorugh DNS flow by using different levels (Root, TLD & authorative servers).

**Real Example**:
  * `curl www.google.com` : It fetch and display raw HTML/API content.
  * `curl -i www.google.com` : Fetch headers only (Can be use for checking Status code)
  * `curl -v www.google.com` : This is a verbose mode, to fetch and display the entire handshake & request/response details for debugging.

  Snapshot: 
  <img width="932" height="481" alt="image" src="https://github.com/user-attachments/assets/41261795-bf1f-4933-9bd4-1e4933d30123" />

## Hands-On Checklist
* **Identity**:
  * E.g. `hostname -I` / `ip addr show` : These commands prints all IP addresses assigned to my network interface. 
  172.31.43.160 (Primary IP Address assigned my network interface i.e. AWS EC2 Instance.
  172.17.0.1 (The internal bridge IP Address assigned to the docker network interface.
    
* **Reachability**:
  * E.g. `ping -c 5 www.trainwithshubham.com` : This command used to test the network reachability for any particular IP/host. It depends on ICMP echo request & replies.
  * Output: The connection is healthy with 157ms average latency & 0% packet loss & 0.041ms jitter (Unwanted variation in network delay).
  
  Snapshots:

  <img width="957" height="427" alt="image" src="https://github.com/user-attachments/assets/553f5c6b-f978-4525-862a-61c23e804092" />


* **PATH** :
  * E.g. `traceroute www.trainwithshubham.com` : Command use to track the path of data packets to reach a destination host.
  * The command output shows it tooks 30 hops total, and traceroute failed to reach destination, stopping after hop 7 with continuous timeout upto maximum 30 hops.
  * During initial hops 1-3: took 36-38 ms latency.
  * Hops 4-5 : Latency jumped from 38ms to ~137-150ms. This indicates that traffic cross an ISP boundary and was routed international network. 

  Snapshot:
  
  <img width="955" height="463" alt="image" src="https://github.com/user-attachments/assets/73e3391d-6ab3-4534-ab2f-121d674f545d" />

* **Ports**: Ports are the logical/virtual endpoints for identifying/distinguish different aplications/services.
  * E.g. `ss tulpn` / `netstat tulpn` : There are two open ports I found in the output.
  * Port 22 (STATE:LISTEN):  SSH Service open for all incoming traffic
  * PORT 80 (STATE:LISTEN): Port 80 is open for all web servers to accept HTTP traffic from any IP.

* **NAME Resolution** :
  * E.g. `dig www.trainwithshubham.com` or `nslookup trainwithshubham.com` : Both these commands are used to query the Domain Name System (DNS), to find Public IP address using website name.
  * Output: This currently resolves two IPs: 146.190.8.92/152.42.156.175

  Snapshots:

  <img width="647" height="447" alt="image" src="https://github.com/user-attachments/assets/da52c045-2611-4525-8b78-fa0a09525014" />

* **HTTP Check** : Fetch headers only (Can be use for checking Status code)
  * E.g. `curl -i www.trainwithshubham.com` : HTTP/1.1 301 Moved Permanently (Because it is using https not http)
  * E.g. `curl -i https://www.trainwithshubham.com` : HTTP/2 200 (Status OK)

   Snapshot:

  <img width="649" height="443" alt="image" src="https://github.com/user-attachments/assets/deee7861-410b-4b8c-a09b-7e6af1bc5dca" />

* **Connection Snapshot** :
  * E.g. `netstat -an | head` : Display all TCP & UDP Connections and Shows IP Addresses & Port numbers.
  * Total count of 'ESTABLISHED' connection is '1' on PORT 22 (SSH) and 'LISTEN' state is '7' (PORT 53 (DNS), PORT 80(HTTP)).

  Snapshot:

  <img width="672" height="164" alt="image" src="https://github.com/user-attachments/assets/03b19c81-725e-4970-81b3-73716d65e470" />

## Mini Task : Port Probe & Interpret
1. Identify one listening port: PORT 22(SSH) & PORT 80(HTTP) are Open to listen.
2. When tested on same machine with commands below:
   * `nc -zv localhost 22` : O/P - Connection to localhost (127.0.0.1) 22 port [tcp/ssh] succeeded!
   * `curl -I http://localhost:80` : O/P - HTTP/1.1 200 OK /n Server: nginx/1.24.0 (Ubuntu)
3. After testing the connection with localhost on Port 22 & 80, connection are successful and able to reach. If, it was not supposed to reachable
    then my first step is to check whether inbound rules are defined or not for these ports in Security groups.
    And, if firewall level it is open then will check the service status for 'SSH' for Port 22 & 'Nginx' for Port 80.

## What I Learned (Reflection)
* The `ping` & `traceroute` commands gave me the fastest result. The ping command shows me whether I am able to reaceive the 100 % result with 0% packet loss or not.
* Using the `traceroute` command, I am able to locate where exactly system is failing/timing out to reach the destination.
* If DNS fails, I will check on the application layer for DNS server reachability because layer 7 is responsible for DNS.
* If I got HTTP 500 error, I will check on Application Layer. I will check why application giving 500 error, check for application logs.
* Two follow-up checks that I would run in real incidents are:
    * First, I will check if service/application is reachable or not. This can be done using `ping`. If not, I will check firewall configuration.
    * Second, If firewall is open for incoming traffic on particualr service/application PORT, I will try to locate where exactly it is failing.
    * If It is not failing on network level, then will check for application level logs, whether there is an application code/configuration issue.
