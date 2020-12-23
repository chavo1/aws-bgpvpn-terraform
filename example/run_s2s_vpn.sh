#!/usr/bin/env bash

echo configuring vpn
set -x
TUNNEL1_PUBLIC="$1" # Outside Tunnel IP : <address>
TUNNEL2_PUBLIC="$2" # Outside Tunnel IP : <address>
VTI0="$3" # Inside Tunnel IP : <RFC 3927 IP address>
VTI1="$4" # Inside Tunnel IP : <RFC 3927 IP address>
CGV0="$5" # cgw_inside_address
CGV1="$6" # cgw_inside_address

cat <<EOF | ssh -tt admin@192.168.2.1 | grep -v -e secret -e password

configure
set vpn ipsec auto-firewall-nat-exclude enable
set vpn ipsec ike-group AWS lifetime '28800'
set vpn ipsec ike-group AWS proposal 1 dh-group '2'
set vpn ipsec ike-group AWS proposal 1 encryption 'aes128'
set vpn ipsec ike-group AWS proposal 1 hash 'sha1'
set vpn ipsec ike-group AWS dead-peer-detection action 'restart'
set vpn ipsec ike-group AWS dead-peer-detection interval '15'
set vpn ipsec ike-group AWS dead-peer-detection timeout '30'
set vpn ipsec esp-group AWS compression 'disable'
set vpn ipsec esp-group AWS lifetime '3600'
set vpn ipsec esp-group AWS mode 'tunnel'
set vpn ipsec esp-group AWS pfs 'enable'
set vpn ipsec esp-group AWS proposal 1 encryption 'aes128'
set vpn ipsec esp-group AWS proposal 1 hash 'sha1'
set vpn ipsec ipsec-interfaces interface 'eth0'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} authentication mode 'pre-shared-secret'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} authentication pre-shared-secret 'preshared_key'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} description 'VPC tunnel 1'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} ike-group 'AWS'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} connection-type initiate
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} local-address '192.168.1.10'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} vti bind 'vti0'
set vpn ipsec site-to-site peer ${TUNNEL1_PUBLIC} vti esp-group 'AWS'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} authentication mode 'pre-shared-secret'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} authentication pre-shared-secret 'preshared_key'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} description 'VPC tunnel 2'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} ike-group 'AWS'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} connection-type initiate
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} local-address '192.168.1.10'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} vti bind 'vti1'
set vpn ipsec site-to-site peer ${TUNNEL2_PUBLIC} vti esp-group 'AWS'
set interfaces vti vti0 address '${CGV0}/30'
set interfaces vti vti0 description 'VPC tunnel 1'
set interfaces vti vti0 mtu '1436'
set interfaces vti vti1 address '${CGV1}/30'
set interfaces vti vti1 description 'VPC tunnel 2'
set interfaces vti vti1 mtu '1436'
set protocols bgp 65000 neighbor ${VTI0} remote-as '65515'
set protocols bgp 65000 neighbor ${VTI0} soft-reconfiguration 'inbound'
set protocols bgp 65000 neighbor ${VTI0} timers holdtime '30'
set protocols bgp 65000 neighbor ${VTI0} timers keepalive '10'
set protocols bgp 65000 neighbor ${VTI1} remote-as '65515'
set protocols bgp 65000 neighbor ${VTI1} soft-reconfiguration 'inbound'
set protocols bgp 65000 neighbor ${VTI1} timers holdtime '30'
set protocols bgp 65000 neighbor ${VTI1} timers keepalive '10'
set protocols bgp 65000 network 0.0.0.0/0
commit  
exit discard
exit
EOF
set +x