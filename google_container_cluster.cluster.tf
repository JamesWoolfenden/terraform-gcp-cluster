resource "google_container_cluster" "cluster" {
  provider = google-beta
  #checkov:skip=CKV_GCP_69:node config is on nodepool
  #checkov:skip=CKV_GCP_24:Legacy
  #checkov:skip=CKV_GCP_65:groups not relevant here
  #checkov:skip=CKV_GCP_20:todo

  name       = var.name
  location   = var.location
  network    = var.network.name
  subnetwork = var.subnetwork.name
  project    = var.project.name

  binary_authorization {
    evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE"
  }

  workload_identity_config {
    workload_pool = "${var.project.project_id}.svc.id.goog"
  }
  release_channel {
    channel = var.release_channel
  }

  initial_node_count          = 1
  enable_intranode_visibility = true

  ip_allocation_policy {
    cluster_ipv4_cidr_block       = var.ip_allocation_policy["cluster_ipv4_cidr_block"]
    cluster_secondary_range_name  = var.ip_allocation_policy["cluster_secondary_range_name"]
    services_ipv4_cidr_block      = var.ip_allocation_policy["services_ipv4_cidr_block"]
    services_secondary_range_name = var.ip_allocation_policy["services_secondary_range_name"]
  }

  # authenticator_groups_config {
  #   security_group = var.RBAC_group_name
  # }

  remove_default_node_pool = true
  min_master_version       = "1.27"


  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing_disabled
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
    enable_private_nodes    = true
    enable_private_endpoint = var.private_cluster_config["enable_private_endpoint"]
    master_ipv4_cidr_block  = var.private_cluster_config["master_ipv4_cidr_block"]
  }

  database_encryption {
    state    = "ENCRYPTED"
    key_name = var.key_name
  }
  # master_authorized_networks_config {
  #   cidr_blocks {
  #      display_name=""
  #     cidr_block = var.master_authorized_network_cidr
  #   }
  # }

  enable_shielded_nodes = true

  network_policy {
    enabled = true
  }

  resource_labels = var.resource_labels

  #Pod Security Policy was removed from GKE clusters with version >= 1.25.0
  # pod_security_policy_config {
  #   enabled = true
  # }
}
