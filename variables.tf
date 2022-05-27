#variable "myvariable" {
#  type        = string
#  description = "A description of my variable"
#  default     = ""
#}


variable "resource_group_name" {
  type        = string
  description = "This the name of the Azure resource group where the VPN Gateway has been provisioned"
}

variable "region" {
  type        = string
  description = "This is Azure location where the VPN Gateway will be created"
}

variable "virtual_network_name" {
  type        = string
  description = "This the Azure virtual network name where the VPN Gateway will be provisioned"
}

variable "virtual_wan_name" {
  type        = string
  description = "This is Azure virtual WAN name where the VPN Gateway will be provisioned"
}

variable "virtual_hub_name" {
  type        = string
  description = "This is the Virtual hub name where Azure VPN Gateway will be provisoned"
}

variable "vpn_gateway_name" {
  type        = string
  description = "This is the VPN Gateway name to be used in the VPN Gateway"
}

variable "virtual_hub_address_prefix" {
  type        = string
  description = "This value will define the address prefix ( IP Address set ) on Azure Virtual Virtual Hub"
}

variable "virtual_network_address_space" {
  type = string
  description = "This valie will define the address space IP Range"
}