# holden:ignore:HLD_PROPOSED_004 — disk_size_gb comes from var.node_pool; default is 100 GB, validated by variable constraint
resource "google_container_node_pool" "nodepool" {
  name     = var.node_pool["name"]
  project  = var.zones.project
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_count        = var.node_pool["node_count"]
  max_pods_per_node = var.node_pool["max_pods_per_node"]

  node_config {
    image_type        = "COS_CONTAINERD"
    machine_type      = var.node_pool["machine_type"]
    disk_size_gb      = var.node_pool["disk_size_gb"]
    disk_type         = var.node_pool["disk_type"]
    boot_disk_kms_key = var.boot_disk_kms_key

    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
  }

  autoscaling {
    min_node_count = var.node_pool["autoscaling_min"]
    max_node_count = var.node_pool["autoscaling_max"]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
