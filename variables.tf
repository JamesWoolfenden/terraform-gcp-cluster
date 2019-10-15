variable "name" {
  type = string

}

variable "region" {
  type = string
}

variable "location" {
  type        = string
  description = "The location of the cluster"
}

variable "project" {
  type = string
}

variable "network_project" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "ip_allocation_policy" {
  type = map

}

variable "remove_default_node_pool" {
  type    = bool
  default = true
}

variable private_cluster_master_ipv4_cidr {
  type = string
}

variable "master_authorized_network_cidr" {
  type = string
}

variable "http_load_balancing_disabled" {
  type    = bool
  default = false
}

variable "kubernetes_dashboard_disabled" {
  type    = bool
  default = false
}

variable "network_policy_config_disabled" {
  type    = bool
  default = false
}

variable "maintenance_window" {
  type    = string
  default = "00:30"
}

variable "node_pool" {
  type = map

  default = {
    name              = "default-pool"
    node_count        = "1"
    machine_type      = "n1-standard-2"
    disk_size_gb      = "10"
    disk_type         = "pd-standard"
    autoscaling_min   = "1"
    autoscaling_max   = "10"
    auto_repair       = "true"
    auto_upgrade      = "true"
    max_pods_per_node = "32"
  }
}
