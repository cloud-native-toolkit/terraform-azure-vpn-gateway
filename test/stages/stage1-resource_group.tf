resource "random_string" "cluster_id" {
    length = 5
    special = false
    upper = false
}

module "resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-azure-resource-group"

  resource_group_name = "${var.name_prefix}-${random_string.cluster_id.result}-rg"
  region              = var.region
}