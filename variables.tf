variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group where the VPN Gateway has been provisioned."
}

variable "region" {
  type        = string
  description = "Location/region to keep all your network resources"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vpn_gw_subnet_name" {
  type        = string
  description = "It is mandatory that the associated subnet is named GatewaySubnet"
  default     = "GatewaySubnet"
}

variable "vpn_gw_subnet_ipv4_cidr_blocks" {
  type = string
  description = "This defines the CIDR Value for the Subnet-Gateway"
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of service endpoints for the subnet"
  default     = [
    "Microsoft.ContainerRegistry"
  ]
}

variable "disable_private_link_endpoint_network_policies" {
  type        = bool
  description = "Flag to disable private link endpoint network policies in the subnet."
  default     = false
}

variable "public_ip_name" {
  type        = string
  description = "It provide the Public IP for the VPN Gateway"
  default     = ""
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults is Dynamic"
  default     = "Dynamic"
}

variable "vpn_gateway_name" {
  type        = string
  description = "Name of the Virtual Network Gateway"
}

variable "gateway_type" {
  type        = string
  description = "The type of the Virtual Network Gateway. Options are Vpn or ExpressRoute"
  default     = "Vpn"
}

variable "vpn_type" {
  type        = string
  description = "The routing type of the Virtual Network Gateway. Options are RouteBased or PolicyBased. Defaults is RouteBased"
  default     = "RouteBased"
}

variable "enable_active_active" {
  type        = bool
  description = "An active-active Virtual Network Gateway will be created, if - true. And it requires a HighPerformance or an UltraPerformance sku. An active-standby gateway will be created, if - false. Defaults to false."
  default     = false
}

variable "enable_bgp" {
  type        = bool
  description = "BGP (Border Gateway Protocol) will be enabled if - True for this Virtual Network Gateway. Defaults to false"
  default     = false
}

variable "vpn_gw_sku" {
  type        = string
  description = "Size and capacity of the virtual network gateway. Options are Basic, VpnGw1, VpnGw2"
  default     = "Basic"
}

variable "vpn_ip_configuration_name" {
  type        = string
  description = "Virtual network gateway IP Configuration name details"
  default     = ""
}

variable "private_ip_address_allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Values are Static or Dynamic. Defaults is Dynamic"
  default     = "Dynamic"
}

