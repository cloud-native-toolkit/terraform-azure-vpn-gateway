#variable "myvariable" {
#  type        = string
#  description = "A description of my variable"
#  default     = ""
#}



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

variable "virtual_network_address_space" {
  type        = list(string)
  description = "This will define the required Address Space and CIDR value"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "This will define the required Subnet Address Space and CIDR value"
}

variable "public_ip_name" {
  type        = string
  description = "It provide the Public IP for the VPN Gateway"
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

variable "vpn_ip_configuration" {
  type        = string
  description = "Virtual network gateway IP Configuration name details"
  default     = "vnetGatewayConfig"
}

variable "private_ip_address_allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Values are Static or Dynamic. Defaults is Dynamic"
  default     = "Dynamic"
}

variable "vpn_client_config_address_space" {
  type        = list(string)
  description = "The address space out of which IP addresses for vpn clients will be taken. You can provide the address space in CIDR notation."
}

variable "root_certificate_name" {
  type        = string
  description = "The root certificates is used to sign the client certificate used by the VPN clients to connect to the gateway"
}

variable "public_cert_data_details" {
  type        = string
  description = "The public certificate of the root certificate authority. The certificate must be provided in Base-64 encoded X.509 format (PEM). In particular, this argument must not include the -----BEGIN CERTIFICATE----- or -----END CERTIFICATE----- markers."
}

variable "revoked_certificate_details" {
  type        = string
  description = "A user-defined name of the revoked certificate."
  default     = ""
}

variable "thumbprint_revoke" {
  type        = string
  description = "The SHA1 thumbprint of the certificate to be revoked"
  default     = ""
}

