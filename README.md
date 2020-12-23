# This repo contain an example of Route-Based Site-to-Site VPN to AWS VPC (BGP over IKEv1/IPsec) with [EdgeRouter X](https://www.ui.com/edgemax/edgerouter-x/)

More could be found [HERE](https://help.ui.com/hc/en-us/articles/115016128008-EdgeRouter-Route-Based-Site-to-Site-VPN-to-AWS-VPC-BGP-over-IKEv1-IPsec-)

### IPsec VPN Connection
The IPsec VPN tunnels has the following features:
-  IKEv1
-  Pre-shared keys for authentication
-  Route-based VPN
-  Dynamic routing over BGP

#### Prerequisite 
- You must have a Public "vpn_ip_address" in your terraform.tfvars file.
