module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = var.region
  vpc_name            = module.vnet.name
  subnet_name         = "GatewaySubnet"
  _count              = 1
  ipv4_cidr_blocks    = ["10.1.1.0/24"]
  acl_rules = []
}

