resource "google_service_account" "default" {
  account_id   = var.name
  display_name = "Service Account"
}

resource "google_project_iam_member" "log_writer" {
  project = var.project.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.default.email}"
}

resource "google_project_iam_member" "metric_writer" {
  project = var.project.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.default.email}"
}
