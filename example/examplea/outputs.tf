output "project" {
  value = data.google_project.project
}
output "network" {
  value = data.google_compute_network.gke_network
}
output "subnet" {
  value = data.google_compute_subnetwork.gke_subnetwork
}
output "zones" {
  value = data.google_compute_zones.available
}

output "cluster" {
  value = module.cluster
}
