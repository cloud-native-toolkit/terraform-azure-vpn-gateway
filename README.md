# Azure VPN Gateway

## Module overview

### Description

Module that provisions a VPN Gateway Services, including the following resources:
- virtual network 
- integrated vpn subnet
- public ip
- virtual network gateway

**Note:** This module follows the Terraform conventions regarding how provider configuration is defined within the Terraform template and passed into the module - https://www.terraform.io/docs/language/modules/develop/providers.html. The default provider configuration flows through to the module. If different configuration is required for a module, it can be explicitly passed in the `providers` block of the module - https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly.

### Software dependencies

The module depends on the following software components:

#### Command-line tools

- terraform >= v0.15

#### Terraform providers

- Azure provider >= 2.91.0

### Module dependencies

This module makes use of the output from other modules:

- Azure Resource group - github.com/cloud-native-toolkit/terraform-azure-resource-group
- Azure VNet - github.com/cloud-native-toolkit/terraform-azure-vnet

### Example usage

```hcl-terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.91.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

module "azure-vpn-gateway" {
  source                               = "https://github.com/cloud-native-toolkit/terraform-azure-vpn-gateway"
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

```

