resource "google_compute_health_check" "hc" {
  name               = "proxy-health-check"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "80"
  }
}


resource "google_compute_forwarding_rule" "default" {
  name     = "compute-forwarding-rule"
  region   = "us-central1"

  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.backend.id
  all_ports             = true
  network               = google_compute_network.vpc_network.name
  subnetwork            = google_compute_subnetwork.public_network_1.name
}

resource "google_compute_route" "route-ilb" {
  name         = "route-ilb"
  dest_range   = "0.0.0.0/0"
  network      = google_compute_network.vpc_network.name
  next_hop_ilb = google_compute_forwarding_rule.default.id
  priority     = 2000
}
