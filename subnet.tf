resource "google_compute_subnetwork" "public_network_1" {
  name          = "pub-subnetwork-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "public_network_2" {
  name          = "pub-subnetwork-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "private_network_1" {
  name          = "priv-subnetwork-1"
  ip_cidr_range = "10.0.101.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "private_network_2" {
  name          = "priv-subnetwork-2"
  ip_cidr_range = "10.2.102.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc-network.id
}
