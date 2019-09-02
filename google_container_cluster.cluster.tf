
resource "google_container_cluster" "cluster" {
  provider   = "google-beta"
  location   = var.location
  name       = var.name
  network    = data.google_compute_network.gke_network.self_link
  project    = var.project
  subnetwork = data.google_compute_subnetwork.gke_subnetwork.self_link

  ip_allocation_policy {
    cluster_secondary_range_name  = var.ip_allocation_policy["cluster_secondary_range_name"]
    services_secondary_range_name = var.ip_allocation_policy["services_secondary_range_name"]
  }

  remove_default_node_pool = var.remove_default_node_pool

  node_pool {
    name = "default-pool"
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing
    }

    kubernetes_dashboard {
      disabled = var.kubernetes_dashboard
    }

    network_policy_config {
      disabled = var.network_policy_config
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = var.maintenance_window
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.private_cluster_master_ipv4_cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.master_authorized_network_cidr
    }
  }
}
