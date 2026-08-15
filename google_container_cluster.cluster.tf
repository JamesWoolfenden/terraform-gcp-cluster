# holden:ignore:HLD_GCP_286 — security_group is optional; callers with Google Workspace should set var.security_group
# holden:ignore:HLD_TF_036 — renaming "cluster" would be a breaking change for existing module callers
resource "google_container_cluster" "cluster" {
  name       = var.name
  location   = var.location
  network    = var.network.name
  subnetwork = var.subnetwork.name
  project    = var.project.project_id

  deletion_protection = true

  binary_authorization {
    evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE"
  }

  workload_identity_config {
    workload_pool = "${var.project.project_id}.svc.id.goog"
  }

  release_channel {
    channel = var.release_channel
  }

  initial_node_count = 1

  enable_intranode_visibility = true
  datapath_provider           = "ADVANCED_DATAPATH"
  enable_legacy_abac          = false
  enable_kubernetes_alpha     = false

  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic = false
    }
  }

  rbac_binding_config {
    enable_insecure_binding_system_authenticated   = false
    enable_insecure_binding_system_unauthenticated = false
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block       = var.ip_allocation_policy["cluster_ipv4_cidr_block"]
    cluster_secondary_range_name  = var.ip_allocation_policy["cluster_secondary_range_name"]
    services_ipv4_cidr_block      = var.ip_allocation_policy["services_ipv4_cidr_block"]
    services_secondary_range_name = var.ip_allocation_policy["services_secondary_range_name"]
  }

  remove_default_node_pool = true

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

  master_authorized_networks_config {
    cidr_blocks {
      display_name = "authorized-cidr"
      cidr_block   = var.master_authorized_network_cidr
    }
  }

  database_encryption {
    state    = "ENCRYPTED"
    key_name = var.key_name
  }

  enable_shielded_nodes = true

  confidential_nodes {
    enabled = true
  }

  network_policy {
    enabled = true
  }

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  dynamic "authenticator_groups_config" {
    for_each = var.security_group != "" ? [var.security_group] : []
    content {
      security_group = authenticator_groups_config.value
    }
  }

  resource_labels = var.resource_labels

  lifecycle {
    prevent_destroy = true
  }
}
