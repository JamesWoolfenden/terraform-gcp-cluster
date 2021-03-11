output "network" {
  value       = data.google_compute_subnetwork.gke_subnetwork.network
  description = "The network name or resource link to the parent network of this subnetwork."
}

output "network_description" {
  value       = data.google_compute_subnetwork.gke_subnetwork.description
  description = "Description of this subnetwork."
}

output "ip_cidr_range" {
  value       = data.google_compute_subnetwork.gke_subnetwork.ip_cidr_range
  description = "The IP address range that machines in this network are assigned to, represented as a CIDR block."
}

output "gateway_address" {
  value       = data.google_compute_subnetwork.gke_subnetwork.gateway_address
  description = "The IP address of the gateway."
}

output "private_ip_google_access" {
  value       = data.google_compute_subnetwork.gke_subnetwork.private_ip_google_access
  description = "Whether the VMs in this sub-net can access Google services without assigned external IP addresses."
}

output "secondary_ip_range" {
  value       = data.google_compute_subnetwork.gke_subnetwork.secondary_ip_range
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. Structure is documented below."
}
