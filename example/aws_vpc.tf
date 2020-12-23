module "consul_vpc" {
  source = "git@github.com:chavo1/home-vpc.git"

  vpc_net      = var.vpc_net
  private_cidr = var.private_cidr
}