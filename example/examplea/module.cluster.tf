module "cluster" {
  source                         = "../../"
  ip_allocation_policy           = var.ip_allocation_policy
  master_authorized_network_cidr = module.ip.cidr
  name                           = var.name
  network                        = data.google_compute_network.gke_network
  project                        = data.google_project.project
  node_pool                      = var.node_pool
  private_cluster_config         = var.private_cluster_config
  region                         = var.region
  subnetwork                     = data.google_compute_subnetwork.gke_subnetwork
  network_policy_config_disabled = var.network_policy_config_disabled
  zones=data.google_compute_zones.available
}
