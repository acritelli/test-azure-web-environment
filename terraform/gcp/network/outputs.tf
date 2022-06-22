output "network_name" {
  description = "Name of the deployed GCP network"
  value = google_compute_network.network.name
}
