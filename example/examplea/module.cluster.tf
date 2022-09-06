module "cluster" {
  source                         = "../../"
  ip_allocation_policy           = var.ip_allocation_policy
  master_authorized_network_cidr = module.ip.cidr
  name                           = var.name
  network                        = data.google_compute_network.gke_network
  network_policy_config_disabled = var.network_policy_config_disabled
  node_pool                      = var.node_pool
  private_cluster_config         = var.private_cluster_config
  project                        = data.google_project.project
  RBAC_group_name                = "gke-security-groups@gmail.com"
  region                         = var.region
  subnetwork                     = data.google_compute_subnetwork.gke_subnetwork
  zones                          = data.google_compute_zones.available
}
