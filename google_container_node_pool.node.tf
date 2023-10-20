resource "google_container_node_pool" "nodepool" {
  name     = var.node_pool["name"]
  location = local.location
  project  = var.zones.project
  cluster  = google_container_cluster.cluster.name

  node_count        = var.node_pool["node_count"]
  max_pods_per_node = var.node_pool["max_pods_per_node"]
  #tfsec:ignore:GCP012
  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    image_type   = "COS"

    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
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
