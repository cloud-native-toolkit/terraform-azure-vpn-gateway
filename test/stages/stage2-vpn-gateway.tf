module "azure-vpn-gateway" {
  source = "./module"
  region = var.region
  resource_group_name = module.resource-group.name
  virtual_network_name = module.vnet.name
  virtual_wan_name = "isl-ahm-wan"
  virtual_hub_name = "isl-ahm-hub"
  vpn_gateway_name = "isl-ahm-vpng"
  virtual_hub_address_prefix = "10.0.1.0/24"
  virtual_network_address_space = "10.0.0.0/16"
}
