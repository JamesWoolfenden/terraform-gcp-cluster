name            = "exampleB"
region          = "us-central1"
location        = "us-central1-a"
project         = "odsp-production"
network_project = "odsp-management"
network         = ""
subnetwork      = ""
ip_allocation_policy = {
  cluster_secondary_range_name  = null
  services_secondary_range_name = null
  cluster_ipv4_cidr_block       = null
  node_ipv4_cidr_block          = null
  services_ipv4_cidr_block      = null
  create_subnetwork             = false
  subnetwork_name               = ""
  use_ip_aliases                = true
}

http_load_balancing_disabled   = false
kubernetes_dashboard_disabled  = true
network_policy_config_disabled = false
remove_default_node_pool       = false
private_cluster_config = {
  master_ipv4_cidr_block  = "172.16.0.0/28"
  enable_private_endpoint = true
  enable_private_nodes    = true
}
master_authorized_network_cidr = ""
maintenance_window             = "09:30"

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
