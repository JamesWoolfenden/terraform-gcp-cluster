# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
# holden:ignore:HLD_TF_027 — GKE clusters require many inputs; Kubernetes configuration is inherently complex
module "cluster" {
  source                         = "../../"
  ip_allocation_policy           = var.ip_allocation_policy
  master_authorized_network_cidr = module.ip.cidr
  name                           = var.name
  network                        = google_compute_network.gke_network
  http_load_balancing_disabled   = var.http_load_balancing_disabled
  network_policy_config_disabled = var.network_policy_config_disabled
  node_pool                      = var.node_pool
  private_cluster_config         = var.private_cluster_config
  project                        = data.google_project.this
  location                       = var.location
  subnetwork                     = google_compute_subnetwork.gke_subnetwork
  zones                          = data.google_compute_zones.available
  key_name                       = google_kms_crypto_key.cluster.id
  boot_disk_kms_key              = google_kms_crypto_key.nodepool.id
}

resource "random_string" "random" {
  length  = 4
  special = false
}
