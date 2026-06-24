
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

resource "google_kms_crypto_key" "nodepool" {
  name            = "${var.name}-nodepool-${random_string.random.result}"
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
    "serviceAccount:service-${data.google_project.this.number}@container-engine-robot.iam.gserviceaccount.com",
    "serviceAccount:${module.cluster.service_account.email}"
  ]
}

resource "google_kms_crypto_key_iam_binding" "nodepool" {
  crypto_key_id = google_kms_crypto_key.nodepool.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.this.number}@compute-system.iam.gserviceaccount.com",
  ]
}
