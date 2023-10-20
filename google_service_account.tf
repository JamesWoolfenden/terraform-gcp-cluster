resource "google_service_account" "default" {
  account_id   = var.name
  display_name = "Service Account"
}
