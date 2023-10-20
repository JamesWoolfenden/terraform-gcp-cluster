
resource "google_kms_key_ring" "cluster" {
  name     = var.name
  location = var.region
}

resource "google_kms_crypto_key" "cluster" {
  name     = var.name
  key_ring = google_kms_key_ring.cluster.id
}

resource "google_kms_crypto_key_iam_binding" "cluster" {
  crypto_key_id = google_kms_crypto_key.cluster.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${var.project.number}@container-engine-robot.iam.gserviceaccount.com",
    "serviceAccount:${google_service_account.default.email}"
  ]

}