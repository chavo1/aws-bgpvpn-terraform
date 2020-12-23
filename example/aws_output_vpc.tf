output "vpc" {
  value = module.consul_vpc.vpc
}

output "main_route_table_id" {
  value = module.consul_vpc.main_route_table_id
}

