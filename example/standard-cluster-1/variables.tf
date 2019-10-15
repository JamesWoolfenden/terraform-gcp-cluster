variable "name" {
  type = string

}

variable "region" {
  type = string
}

variable "location" {
  type = string
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
  type = bool
}

variable "master_authorized_network_cidr" {
  type = string
}

variable "http_load_balancing_disabled" {
  type = bool
}

variable "kubernetes_dashboard_disabled" {
  type = bool
}

variable "network_policy_config_disabled" {
  type = bool
}

variable "maintenance_window" {
  type = string
}

variable "node_pool" {
  type = map
}

variable "private_cluster_config" {
  type = map
}
