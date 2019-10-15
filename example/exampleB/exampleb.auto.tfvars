name            = "exampleB"
region          = "us-central1"
location        = "us-central1-a"
project         = "odsp-production"
network_project = "odsp-management"
network         = "
subnetwork      = ""
ip_allocation_policy = {
  cluster_secondary_range_name  = ""
  services_secondary_range_name = ""
}

private_cluster_master_ipv4_cidr = "172.16.0.0/28"
master_authorized_network_cidr   = ""
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
