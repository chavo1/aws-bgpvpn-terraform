variable "vpn_bgp_asn" {
  description = "BPG Autonomous System Number (ASN) of the customer gateway for a dynamically routed VPN connection."
}
variable "zone" {
  description = "availability zone to use."
}
variable "preshared_key" {
  description = "preshared key used for VPNtunnels"
}
variable "home_cidr" {
  description = "remote home subnet"
}
variable "name_vpn" {
  description = "The name of the VPC."
}
variable "vpn_ip_address" {
  description = "The name of the VPC."
}
variable "amazon_side_asn" {}