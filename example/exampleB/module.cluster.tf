module "cluster" {
  source                           = "../../"
  ip_allocation_policy             = var.ip_allocation_policy
  location                         = var.location
  master_authorized_network_cidr   = module.ip.cidr
  name                             = var.name
  network                          = var.network
  network_project                  = var.network_project
  node_pool                        = var.node_pool
  private_cluster_config           = var.private_cluster_config
  region                           = var.region
  subnetwork                       = var.subnetwork
  network_policy_config_disabled   = var.network_policy_config_disabled
}
