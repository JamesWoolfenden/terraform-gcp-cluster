output "service_account" {
  value       = google_service_account.default
  description = "The service account used by the GKE cluster."
}

output "cluster" {
  value       = google_container_cluster.cluster
  description = "The GKE cluster resource."
  sensitive   = true
}

output "node_pool" {
  value       = google_container_node_pool.nodepool
  description = "The GKE node pool resource."
  sensitive   = true
}
