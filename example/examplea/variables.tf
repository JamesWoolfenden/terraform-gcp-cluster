variable "name" {
  type        = string
  description = "The name of the GKE cluster"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,38}[a-z0-9]$", var.name))
    error_message = "Cluster name must be 2-40 characters, lowercase alphanumeric and hyphens, starting with a letter."
  }
}

variable "region" {
  type        = string
  description = "The GCP region to deploy into"
  validation {
    condition     = can(regex("^[a-z]+-[a-z]+[0-9]+$", var.region))
    error_message = "region must be a valid GCP region (e.g. us-central1)."
  }
}

variable "network" {
  type        = string
  description = "The name of the VPC network to create"
  validation {
    condition     = length(var.network) > 0
    error_message = "network must not be empty."
  }
}

variable "subnetwork" {
  type        = string
  description = "The name of the subnetwork to create"
  validation {
    condition     = length(var.subnetwork) > 0
    error_message = "subnetwork must not be empty."
  }
}

variable "ip_allocation_policy" {
  type        = map(any)
  description = "Values to fill the cluster ip_allocation_policy block"
  validation {
    condition = (
      can(var.ip_allocation_policy["cluster_secondary_range_name"]) &&
      can(var.ip_allocation_policy["services_secondary_range_name"])
    )
    error_message = "ip_allocation_policy must contain cluster_secondary_range_name and services_secondary_range_name."
  }
}

variable "http_load_balancing_disabled" {
  type        = bool
  description = "Whether to disable the HTTP load balancing addon"
  default     = false
}

variable "network_policy_config_disabled" {
  type        = bool
  description = "Whether to disable the network policy addon"
  default     = false
}

variable "node_pool" {
  type        = map(any)
  description = "Configuration of the GKE node pool"
  validation {
    condition = alltrue([
      can(var.node_pool["name"]),
      can(var.node_pool["node_count"]),
      can(var.node_pool["machine_type"]),
      can(var.node_pool["disk_size_gb"]),
      can(var.node_pool["disk_type"]),
      can(var.node_pool["autoscaling_min"]),
      can(var.node_pool["autoscaling_max"]),
      can(var.node_pool["max_pods_per_node"]),
    ])
    error_message = "node_pool must contain: name, node_count, machine_type, disk_size_gb, disk_type, autoscaling_min, autoscaling_max, max_pods_per_node."
  }
}

variable "private_cluster_config" {
  type        = map(any)
  description = "Values to fill the cluster private_cluster_config block"
  validation {
    condition = (
      can(var.private_cluster_config["enable_private_endpoint"]) &&
      can(var.private_cluster_config["enable_private_nodes"]) &&
      can(var.private_cluster_config["master_ipv4_cidr_block"])
    )
    error_message = "private_cluster_config must contain enable_private_endpoint, enable_private_nodes, and master_ipv4_cidr_block."
  }
}

variable "location" {
  type        = string
  description = "The GCP location (region or zone) for the cluster"
  validation {
    condition     = length(var.location) > 0
    error_message = "location must not be empty."
  }
}

variable "subnetwork_cidr" {
  type        = string
  description = "Primary CIDR range for the subnetwork"
  default     = "10.0.0.0/24"
  validation {
    condition     = can(cidrnetmask(var.subnetwork_cidr))
    error_message = "subnetwork_cidr must be a valid CIDR block."
  }
}

variable "pods_cidr" {
  type        = string
  description = "Secondary CIDR range for GKE pods"
  default     = "10.1.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.pods_cidr))
    error_message = "pods_cidr must be a valid CIDR block."
  }
}

variable "services_cidr" {
  type        = string
  description = "Secondary CIDR range for GKE services"
  default     = "10.2.0.0/20"
  validation {
    condition     = can(cidrnetmask(var.services_cidr))
    error_message = "services_cidr must be a valid CIDR block."
  }
}
