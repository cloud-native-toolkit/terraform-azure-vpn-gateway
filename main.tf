
#======================================================================================
# Manages a (VPN Gateway) Virtual Network Gateway to establish a secure, 
# cross-premises connectivity.
#======================================================================================

#===============================
# Resource Group, VNet, Subnet 
#===============================

# resource "azurerm_resource_group" "resource_group" {
#   name     = var.resource_group_name
#   location = var.region
# }

# resource "azurerm_virtual_network" "virtual_network" {
#   name                = var.virtual_network_name
#   location            = var.region
#   resource_group_name = var.resource_group_name
#   address_space       = var.virtual_network_address_space
# }

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_space
}

#=================================================
# Public IP, Virtual Network Gateway, Certificates 
#=================================================

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
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
    name                          = var.vpn_ip_configuration
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = var.private_ip_address_allocation_method
    subnet_id                     = azurerm_subnet.subnet.id
  }

#   vpn_client_configuration {
#     address_space = var.vpn_client_config_address_space

#     root_certificate {
#       name             = var.root_certificate_name
#       public_cert_data = var.public_cert_data_details
#     }

#     revoked_certificate {
#       name       = var.revoked_certificate_details
#       thumbprint = var.thumbprint_revoke

#     }
#   }
}

