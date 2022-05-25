



resource "azurerm_virtual_wan" "virtual_wan" {
  name                = var.virtual_wan_name
  resource_group_name = var.resource_group_name
  location            = var.region
}

resource "azurerm_virtual_hub" "virtual_hub" {
  name                = var.virtual_hub_name
  resource_group_name = var.resource_group_name
  location            = var.region
  virtual_wan_id      = azurerm_virtual_wan.virtual_wan.id
  address_prefix      = var.azurerm_virtual_hub_address_prefix
}

resource "azurerm_vpn_gateway" "vpn_gateway" {
  name                = var.vpn_gateway_name
  location            = var.region
  resource_group_name = var.resource_group_name
  virtual_hub_id      = azurerm_virtual_hub.virtual_hub.id
}

