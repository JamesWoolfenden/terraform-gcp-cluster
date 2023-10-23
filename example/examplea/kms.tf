
resource "google_kms_key_ring" "cluster" {
  name     = "${var.name}${random_string.random.result}"
  location = var.region
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key" "cluster" {
  name            = "${var.name}${random_string.random.result}"
  key_ring        = google_kms_key_ring.cluster.id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "cluster" {
  crypto_key_id = google_kms_crypto_key.cluster.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.project.number}@container-engine-robot.iam.gserviceaccount.com",
    "serviceAccount:${module.cluster.service_account.email}"
  ]

}
