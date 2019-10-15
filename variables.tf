variable "name" {
  description = "The Name of the cluster"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "location" {
  type        = string
  description = "The location of the cluster"
}

variable "network_project" {
  description = "The GCP project of the Network the cluster is in"
  type        = string
}

variable "network" {
  description = "The name of the VPC"
  type        = string
}

variable "subnetwork" {
  description = "The name of the sub-net to use"
  type        = string
}

variable "ip_allocation_policy" {
  description = "Values to fill the cluster ip_allocation_policy block"
  type        = map
}

variable "remove_default_node_pool" {
  description = "An override to remove the node pool, doesnt make much sense to me either"
  type        = bool
  default     = true
}

variable "private_cluster_config" {
  description = "Values to fill the cluster private_cluster_config block"
  type        = map
}

variable "master_authorized_network_cidr" {
  description = "The range of IPs that can connect to the Kubernetes master"
  type        = string
}

variable "http_load_balancing_disabled" {
  description = "Disable Http Load balancing"
  type        = bool
  default     = false
}

variable "kubernetes_dashboard_disabled" {
  description = "Switch on the Dashboard"
  type        = bool
  default     = false
}

variable "network_policy_config_disabled" {
  description = "Toggle network policy"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  type    = string
  default = "00:30"
}

variable "node_pool" {
  description = "Configuration of the Node hosts"
  type        = map

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
