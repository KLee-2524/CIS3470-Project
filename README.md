# CIS3470-Project
This repository will contain Terraform code meant to recreate the cloud infrastructure I deployed for my CIS3470 final project. The requirements for that project were as follows:

1. Create an Azure Server VM using a B2-Series Server.  (Windows Server 2022 Data Center)           
3. Resize your Azure VM from B2s to B2ms and provide log proof of process.
4. Keep track of the cost of running your VM and VPN.
5. Use Azure DNS to create a DNS pointer.
6. Create a VPN VNet.
7. Create VPN gateway that functions in your Vnet Range.
8. Create a public IP.
9. Create Self-Signed Azure SSL Certificates. (1 Root, and 2 Clients)
10. Deploy Self-Signed Azure SSL Certificates.
11. Show that both client certificates work. Then retract the second only; demonstrate that client 1 still functions and client 2 does not.

While this project was originally done in Microsoft Azure, I will be attempting to translate this into an AWS deployment instead. This is due to the fact that my internship team uses AWS instead of Azure, and because I would like hands on practice with AWS in advance of taking the AWS Certified Cloud Practitioner Exam. 
