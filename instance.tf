resource "google_compute_instance" "default" {
  project      = "cloudjupyter-bhanu"
  count	       = 3
  machine_type = "g1-small"
  zone         = "asia-south1-c"
  name = "${format("hadoop-%03d", count.index + 1)}"

  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-7"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

