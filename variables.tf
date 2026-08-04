variable "name" {
  description = "The Name of the cluster"
  type        = string
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,38}[a-z0-9]$", var.name))
    error_message = "Cluster name must be 2-40 characters, lowercase alphanumeric and hyphens only, start with a letter."
  }
}

variable "zones" {
  description = "The available GCP compute zones"
  type        = any
  validation {
    condition     = can(var.zones.project)
    error_message = "zones must be an object with a project attribute (e.g. data.google_compute_zones.available)."
  }
}

variable "project" {
  description = "The GCP project of the Network the cluster is in"
  type        = any
  validation {
    condition     = can(var.project.project_id) && can(var.project.name)
    error_message = "project must be an object with project_id and name attributes (e.g. data.google_project.this)."
  }
}

variable "network" {
  description = "The VPC"
  type        = any
  validation {
    condition     = can(var.network.name)
    error_message = "network must be an object with a name attribute (e.g. google_compute_network.main)."
  }
}
variable "subnetwork" {
  description = "The subnetwork to use"
  type        = any
  validation {
    condition     = can(var.subnetwork.name)
    error_message = "subnetwork must be an object with a name attribute (e.g. google_compute_subnetwork.main)."
  }
}
variable "ip_allocation_policy" {
  description = "Values to fill the cluster ip_allocation_policy block"
  type        = map(any)
  validation {
    condition = (
      can(var.ip_allocation_policy["cluster_secondary_range_name"]) &&
      can(var.ip_allocation_policy["services_secondary_range_name"])
    )
    error_message = "ip_allocation_policy must contain cluster_secondary_range_name and services_secondary_range_name."
  }
}

variable "private_cluster_config" {
  description = "Values to fill the cluster private_cluster_config block"
  type        = map(any)
  validation {
    condition = (
      can(var.private_cluster_config["enable_private_endpoint"]) &&
      can(var.private_cluster_config["enable_private_nodes"]) &&
      can(var.private_cluster_config["master_ipv4_cidr_block"])
    )
    error_message = "private_cluster_config must contain enable_private_endpoint, enable_private_nodes, and master_ipv4_cidr_block."
  }
}
variable "master_authorized_network_cidr" {
  description = "The range of IPs that can connect to the Kubernetes master"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.master_authorized_network_cidr))
    error_message = "master_authorized_network_cidr must be a valid CIDR block (e.g. 203.0.113.0/32)."
  }
}
variable "http_load_balancing_disabled" {
  description = "Disable Http Load balancing"
  type        = bool
  default     = false
}
variable "network_policy_config_disabled" {
  description = "Toggle network policy"
  type        = bool
  default     = false
}
variable "maintenance_window" {
  description = "The daily maintenance start time in HH:MM format"
  type        = string
  default     = "00:30"
  validation {
    condition     = can(regex("^(?:[01]\\d|2[0-3]):[0-5]\\d$", var.maintenance_window))
    error_message = "The maintenance_window must be in HH:MM 24-hour format."
  }
}

variable "node_pool" {
  description = "Configuration of the Node hosts"
  type        = map(any)
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

  default = {
    name              = "default-pool"
    node_count        = "1"
    machine_type      = "n2d-standard-2"
    disk_size_gb      = "100"
    disk_type         = "pd-balanced"
    autoscaling_min   = "1"
    autoscaling_max   = "10"
    auto_repair       = "true"
    auto_upgrade      = "true"
    max_pods_per_node = "32"
  }
}

variable "resource_labels" {
  type        = map(any)
  description = "Resource labels to apply to the cluster"
  validation {
    condition     = length(var.resource_labels) > 0
    error_message = "resource_labels must contain at least one label."
  }
  default = {
    "createdby" = "terraform"
    module      = "terraform-gcp-cluster"
  }
}

variable "release_channel" {
  type        = string
  description = "Set the release channel UNSPECIFIED|RAPID|REGULAR|STABLE"
  default     = "STABLE"
  validation {
    condition     = can(regex("UNSPECIFIED|RAPID|REGULAR|STABLE", var.release_channel))
    error_message = "Release channel must be one of UNSPECIFIED|RAPID|REGULAR|STABLE."
  }
}


variable "key_name" {
  type        = string
  description = "Changing key name as keys and key rings are undeletable"
  sensitive   = true

  validation {
    condition     = length(var.key_name) > 0
    error_message = "The key_name variable must not be empty."
  }
}

variable "location" {
  type        = string
  description = "The GCP location (region or zone)"
  validation {
    condition     = length(var.location) > 0
    error_message = "The location variable must not be empty."
  }
}

variable "security_group" {
  type        = string
  description = "Google Workspace group email for GKE RBAC via authenticator_groups_config. Leave empty to disable."
  default     = ""
  validation {
    condition     = var.security_group == "" || can(regex("^[^@]+@[^@]+\\.[^@]+$", var.security_group))
    error_message = "security_group must be empty or a valid email address."
  }
}

variable "boot_disk_kms_key" {
  type        = string
  description = "Customer-managed KMS key for node pool boot disk encryption (full resource name)"
  sensitive   = true

  validation {
    condition     = length(var.boot_disk_kms_key) > 0
    error_message = "boot_disk_kms_key must not be empty."
  }
}
