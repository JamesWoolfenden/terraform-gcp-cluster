name            = "test-cluster-1"
region          = "us-central1"
location        = "us-central1a"
project         = "odsp-production"
network_project = "odsp-management"
network         = "odsp-production-network"
subnetwork      = "odsp-prod-subnets"
ip_allocation_policy = {
  cluster_secondary_range_name  = "odsp-prod-sub-16"
  services_secondary_range_name = "odsp-prod-sub-48"
}

private_cluster_master_ipv4_cidr = "172.16.0.0/28"
master_authorized_network_cidr   = "10.25.96.0/20"
maintenance_window               = "09:30"

node_pool = {
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
