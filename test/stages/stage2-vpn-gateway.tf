module "azure-vpn-gateway" {
  source                               = "./module"
  region                               = var.region
  resource_group_name                  = module.resource_group.name
  virtual_network_name                 = module.vnet.name
  vpn_gateway_name                     = "${var.name_prefix}-vpn"
  vpn_gw_subnet_ipv4_cidr_blocks       = "10.0.1.0/24"
}
