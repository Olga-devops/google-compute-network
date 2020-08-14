resource "google_compute_backend_bucket" "image_backend" {
  name        = "backend-bucket"
  description = "Contains beautiful images"
  bucket_name = google_storage_bucket.image_bucket.name
  enable_cdn  = true
}

resource "google_storage_bucket" "olga_bucket" {
  name     = "olga-bucket"
  location = "EU"
}
