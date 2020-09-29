
resource "google_container_cluster" "cluster" {
  #checkov:skip=CKV_GCP_13: "Ensure a client certificate is used by clients to authenticate to Kubernetes Engine Clusters"
  #checkov:skip=CKV_GCP_22: "Ensure Container-Optimized OS (cos) is used for Kubernetes Engine Clusters Node image"
  provider           = google-beta
  name               = var.name
  location           = var.location
  initial_node_count = 1
  project            = data.google_project.project.name

  network    = var.network
  subnetwork = var.subnetwork

  ip_allocation_policy {
    cluster_ipv4_cidr_block       = var.ip_allocation_policy["cluster_ipv4_cidr_block"]
    cluster_secondary_range_name  = var.ip_allocation_policy["cluster_secondary_range_name"]
    node_ipv4_cidr_block          = var.ip_allocation_policy["node_ipv4_cidr_block"]
    services_ipv4_cidr_block      = var.ip_allocation_policy["services_ipv4_cidr_block"]
    services_secondary_range_name = var.ip_allocation_policy["services_secondary_range_name"]
    use_ip_aliases                = var.ip_allocation_policy["use_ip_aliases"]
  }

  remove_default_node_pool = var.remove_default_node_pool

  master_auth {

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing_disabled
    }

    kubernetes_dashboard {
      disabled = var.kubernetes_dashboard_disabled
    }

    network_policy_config {
      disabled = var.network_policy_config_disabled
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = var.maintenance_window
    }
  }

  private_cluster_config {
    enable_private_nodes    = var.private_cluster_config["enable_private_nodes"]
    enable_private_endpoint = var.private_cluster_config["enable_private_endpoint"]
    master_ipv4_cidr_block  = var.private_cluster_config["master_ipv4_cidr_block"]
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.master_authorized_network_cidr
    }
  }

  network_policy {
    enabled = true
  }

  pod_security_policy_config {
    enabled = var.pod_security_policy_config_enabled
  }

  resource_labels = {
    "createdby" = "terraform"
  }

}

variable "resource_labels" {
  type = map
  default = {
    "createdby" = "terraform"
  }

}


variable "pod_security_policy_config_enabled" {
  type    = bool
  default = true
}
