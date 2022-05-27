module "vnet" {
  source = "github.com/cloud-native-toolkit/terraform-azure-vnet"

  resource_group_name  = module.resource_group.name
  region               = var.region
  name_prefix          = var.name_prefix
  address_prefix_count = 1
  address_prefixes     = ["10.0.0.0/8"]
  enabled              = true
}
