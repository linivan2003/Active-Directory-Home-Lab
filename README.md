# Active-Directory-Home-Lab
- Set up Active Directory (AD) on a Windows Server VM to create a domain, manage users, and enable centralized authentication for multiple virtual machines!  
- Use Group Policy Management (GPOs) to enforce security settings, software installations, and user restrictions across all connected devices in the domain!
## Environments
- [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
- [Virtual Box Extension Pack](https://www.virtualbox.org/wiki/Downloads)
- [Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10)
- [Server 2019 ISO](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
## High Level Overview ##
We will  be using 2 VMs to simulate an Active Directory environment.
![Alt text](AD_HIGH_LEVEL_IMAGE.png)
### First Machine ###
**Windows Server 2019 (Domain Controller - DC)**  
Purpose: Acts as the Domain Controller (DC) for managing users, authentication, and security policies.  
Roles Installed:  
Active Directory Domain Services (AD DS)  
DNS Server (for name resolution)  
DHCP Server (assigns IPs to clients)  
Network Configuration:  
NIC 1 (Internet): Gets an IP from the home router (via DHCP).  
NIC 2 (Internal Network):  
IP Address: 172.16.0.1  
Subnet Mask: 255.255.255.0  
Gateway: <empty>  
DNS: 127.0.0.1 (self-referencing for AD)  
### Second Machine ###
**Windows 10 Client (Domain-Joined Workstation)**    
Purpose: Simulates a domain-joined client to test authentication, Group Policy Objects (GPOs), and domain settings.  
Configuration:  
Installed from a Windows 10 ISO.  
Joins the Active Directory domain (mydomain.com).  
Network Configuration:  
NIC (Internal Network Only)  
IP Assignment: Receives IP dynamically via DHCP from the Domain Controller (DC).  
## Setup ##
### Creating Domain Controller ###
1. Set up Domain Controller Virtual Machine using Virtual Box
2. In Settings, Add an Additional Network(Internal Network)(This is our internal Server)
3. Boot up First VM using the Windows Server 2019 ISO
4. Set up the Server 2019 ISO, use Desktop Experience, otherwise it will just be a command line
5. To pass ctrl-alt-del because It's a virtual machine, do "insert" and "insert ctrl-alt-del
#### Setting up Internal Network ####
1. Open Network Adapater 
2. Identify Internal Network and Wifi that connects to the outer world(usually the world wifi will start with a 10.xxx)
3. ipv4 with 169.254.41.101 will be internal network
4. (Optional) Name them to their corresponding network purpose
5. Rename PC TO "DC" For Clarity Purposes
6. Set IP of DC to 172.16.0.1
7. Set Subnet Mask to 255.255.255.0
8. Leave Default Gateway Empty
8. set Preferred DNS Server 127.0.0.1
#### Setting Up Active Directory and Domain Name ####
1. In Windows Server Manager, add roles and features
2. Press next, and when the checkbox pops up, choose to add Active Directory Domain Services
3. Proceed and Install, may take a minute
