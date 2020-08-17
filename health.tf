resource "google_compute_health_check" "tcp-health-check" {
  name        = "tcp-health-check"
  description = "Health check via tcp"

  timeout_sec         = 1
  check_interval_sec  = 1
  healthy_threshold   = 4
  unhealthy_threshold = 5

  tcp_health_check {
    port_name          = "health-check-port"
    port_specification = "USE_NAMED_PORT"
    request            = "ARE YOU HEALTHY?"
    proxy_header       = "NONE"
    response           = "I AM HEALTHY"
  }
}
