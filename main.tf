# resource "azurerm_subnet" "subnet" {
#   name                 = var.subnet_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = var.subnet_address_space
# }

#===================================
# Public IP, Virtual Network Gateway
#===================================


locals {
  public_ip_name_prefix = "${var.vpn_gateway_name}-pip"
  vpn_ip_configuration_name_prefix = "${var.vpn_gateway_name}-ip-config"
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name != "" ? var.public_ip_name : local.public_ip_name_prefix
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                = var.vpn_gateway_name
  location            = var.region
  resource_group_name = var.resource_group_name

  type     = var.gateway_type
  vpn_type = var.vpn_type

  active_active = var.enable_active_active
  enable_bgp    = var.enable_bgp
  sku           = var.vpn_gw_sku

  ip_configuration {
    name                          = var.vpn_ip_configuration_name != "" ? var.vpn_ip_configuration_name : local.vpn_ip_configuration_name_prefix
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = var.private_ip_address_allocation_method
    subnet_id                     = var.subnet_id
  }
}

