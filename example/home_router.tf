resource "null_resource" "home_router" {
  provisioner "local-exec" {
    command = "bash run_s2s_vpn.sh ${module.vpn_virginia.vpn_connection_tunnel1_address} ${module.vpn_virginia.vpn_connection_tunnel2_address} ${module.vpn_virginia.tunnel1_vgw_inside_address} ${module.vpn_virginia.tunnel2_vgw_inside_address} ${module.vpn_virginia.tunnel1_cgw_inside_address} ${module.vpn_virginia.tunnel2_cgw_inside_address}"
  }
  depends_on = [
    module.vpn_virginia.tunnel1_cgw_inside_address,
    module.vpn_virginia.tunnel2_cgw_inside_address,
    module.vpn_virginia.vpn_connection_tunnel1_address,
    module.vpn_virginia.vpn_connection_tunnel2_address,
    module.vpn_virginia.tunnel1_vgw_inside_address,
    module.vpn_virginia.tunnel2_vgw_inside_address
  ]
}

resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = "bash run_load_clean.sh"
  }
}
