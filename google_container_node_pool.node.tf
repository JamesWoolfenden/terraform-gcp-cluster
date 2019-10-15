resource "google_container_node_pool" "nodepool" {
  project  = data.google_project.project.name
  provider = "google-beta"
  name     = var.node_pool["name"]
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_count        = var.node_pool["node_count"]
  max_pods_per_node = var.node_pool["max_pods_per_node"]

  node_config {
    machine_type = var.node_pool["machine_type"]
    disk_size_gb = var.node_pool["disk_size_gb"]
    disk_type    = var.node_pool["disk_type"]

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  autoscaling {
    min_node_count = var.node_pool["autoscaling_min"]
    max_node_count = var.node_pool["autoscaling_max"]
  }

  management {
    auto_repair  = var.node_pool["auto_repair"]
    auto_upgrade = var.node_pool["auto_upgrade"]
  }
}
