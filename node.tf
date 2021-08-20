resource "google_compute_instance" "hadoop-n" {
  project      = "nimble-ally-320910"
  count	       = 2
  machine_type = "g1-small"
  zone         = "asia-south2-c"
  name = "${format("hadoop-node-%03d", count.index + 1)}"

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
 labels = {
    environment = "dev"
  }
      service_account {
    scopes = ["cloud-platform"]
  }
}
