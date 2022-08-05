
#===============================================
# VPN Subnet, Public IP, Virtual Network Gateway
#===============================================

locals {
  public_ip_name_prefix = "${var.vpn_gateway_name}-pip"
  vpn_ip_configuration_name_prefix = "${var.vpn_gateway_name}-ip-config"
}

resource "null_resource" "print_name" {
  provisioner "local-exec" {
    command = "echo 'VNet name: ${var.virtual_network_name}'"
  }
}

data "azurerm_virtual_network" "vnet" {
  depends_on = [null_resource.print_name]

  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnets" {
  name                                           = var.vpn_gw_subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = [var.vpn_gw_subnet_ipv4_cidr_blocks]
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.disable_private_link_endpoint_network_policies
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
    subnet_id                     = azurerm_subnet.subnets.id
  }
}

# resource "azurerm_subnet" "subnet" {
#   name                 = var.subnet_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = var.subnet_address_space
# }