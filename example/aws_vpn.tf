module "vpn_virginia" {
  source = "../"

  route_table_id         = module.consul_vpc.main_route_table_id
  vpc_id                 = module.consul_vpc.vpc[0]
  zone                   = var.zone
  vpn_bgp_asn            = var.vpn_bgp_asn
  preshared_key          = var.preshared_key
  destination_cidr_block = var.home_cidr
  name                   = var.name_vpn
  vpn_ip_address         = var.vpn_ip_address
  amazon_side_asn        = var.amazon_side_asn
}