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
