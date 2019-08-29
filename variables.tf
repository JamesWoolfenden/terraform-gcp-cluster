variable "name" {
  default = "test-cluster-1"
}

variable "region" {
  default = "us-central1"
}

/* variable "additional_zones" {
  type = "list"
} */

variable "project" {
  default = "odsp-production"
}

variable "network_project" {
  default = "odsp-management"
}

variable "network" {
  default = "odsp-production-network"
}

variable "subnetwork" {
  default = "odsp-prod-subnets"
}

variable "ip_allocation_policy" {
  type = "map"

  default = {
    cluster_secondary_range_name  = "odsp-prod-sub-16"
    services_secondary_range_name = "odsp-prod-sub-48"
  }
}

variable "remove_default_node_pool" {
  default = "true"
}

variable private_cluster_master_ipv4_cidr {
  default = "172.16.0.0/28"
}

variable "master_authorized_network_cidr" {
  default = "10.25.96.0/20"
}

variable "http_load_balancing" {
  default = "false"
}

variable "kubernetes_dashboard" {
  default = "false"
}

variable "network_policy_config" {
  default = "false"
}

variable "maintenance_window" {
  default = "09:30"
}

variable "node_pool" {
  type = "map"

  default = {
    name                = "default-pool"
    node_count          = "1"
    machine_type        = "n1-standard-2"
    disk_size_gb        = "10"
    disk_type           = "pd-standard"
    autoscaling_min     = "1"
    autoscaling_max     = "10"
    auto_repair         = "true"
    auto_upgrade        = "true"
    max_pods_per_node   = "32"
  }
}
