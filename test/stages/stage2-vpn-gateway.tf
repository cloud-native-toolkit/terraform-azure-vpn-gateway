module "azure-vpn-gateway" {
  source                               = "./module"
  region                               = var.region
  resource_group_name                  = module.resource_group.name
  virtual_network_name                 = module.vnet.name
  public_ip_name                       = "vpn_public_ip"
  public_ip_allocation_method          = "Dynamic"
  vpn_gateway_name                     = "vpn_gateway_name"
  gateway_type                         = "Vpn"
  vpn_type                             = "RouteBased"
  enable_active_active                 = false
  enable_bgp                           = false
  vpn_gw_sku                           = "Basic"
  vpn_ip_configuration_name            = "vnetGatewayConfig"
  private_ip_address_allocation_method = "Dynamic"
  vpn_gw_subnet_name                   = "GatewaySubnet"
  vpn_gw_subnet_ipv4_cidr_blocks       = "10.0.1.0/24"
}
