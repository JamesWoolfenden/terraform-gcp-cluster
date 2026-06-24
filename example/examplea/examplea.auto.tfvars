name       = "cluster-1"
region     = "us-central1"
location   = "us-central1-a"
network    = "cluster-network"
subnetwork = "cluster-network-subnet"

subnetwork_cidr = "10.0.0.0/24"
pods_cidr       = "10.1.0.0/16"
services_cidr   = "10.2.0.0/20"

ip_allocation_policy = {
  cluster_secondary_range_name  = "pods"
  services_secondary_range_name = "services"
  cluster_ipv4_cidr_block       = null
  services_ipv4_cidr_block      = null
}

http_load_balancing_disabled   = false
network_policy_config_disabled = false

private_cluster_config = {
  master_ipv4_cidr_block  = "172.29.0.0/28"
  enable_private_endpoint = true
  enable_private_nodes    = true
}

node_pool = {
  name              = "default-pool"
  node_count        = "4"
  machine_type      = "n2d-standard-2"
  disk_size_gb      = "100"
  disk_type         = "pd-balanced"
  autoscaling_min   = "1"
  autoscaling_max   = "10"
  max_pods_per_node = "32"
}
