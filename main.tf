

resource "azurerm_resource_group" "resource_group" {
  name     = "ahm-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "ahm-network"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_wan" "virtual_wan" {
  name                = "ahm-vwan"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}

resource "azurerm_virtual_hub" "virtual_hub" {
  name                = "ahm-vhub"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  virtual_wan_id      = azurerm_virtual_wan.virtual_wan.id
  address_prefix      = "10.0.2.0/24"
}

resource "azurerm_vpn_gateway" "vpn_gateway" {
  name                = "ahm-vpng"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  virtual_hub_id      = azurerm_virtual_hub.virtual_hub.id
}

