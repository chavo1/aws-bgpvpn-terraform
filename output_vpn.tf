output "vpn_connection_tunnel1_address" {
  value = aws_vpn_connection.vpc-vpn.tunnel1_address
}
output "vpn_connection_tunnel2_address" {
  value = aws_vpn_connection.vpc-vpn.tunnel2_address
}
output "tunnel1_vgw_inside_address" {
  value = aws_vpn_connection.vpc-vpn.tunnel1_vgw_inside_address
}
output "tunnel2_vgw_inside_address" {
  value = aws_vpn_connection.vpc-vpn.tunnel2_vgw_inside_address
}
output "tunnel1_cgw_inside_address" {
  value = aws_vpn_connection.vpc-vpn.tunnel1_cgw_inside_address
}
output "tunnel2_cgw_inside_address" {
  value = aws_vpn_connection.vpc-vpn.tunnel2_cgw_inside_address
}

