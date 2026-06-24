output "project" {
  description = "The Google Cloud project data."
  value       = data.google_project.this
}

output "network" {
  description = "The GKE VPC network resource."
  value       = google_compute_network.gke_network
}

output "subnet" {
  description = "The GKE subnetwork resource."
  value       = google_compute_subnetwork.gke_subnetwork
}

output "zones" {
  description = "The available compute zones for GKE."
  value       = data.google_compute_zones.available
}

output "cluster" {
  description = "The GKE cluster module output."
  value       = module.cluster
}
