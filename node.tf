resource "google_compute_instance" "hadoop-n" {
  project      = "dl-9953189580"
  count        = 2
  machine_type = "e2-standard-2"
  zone         = "us-west1-a"
  name = "${format("hadoop-node-%03d", count.index + 1)}"

  boot_disk {
    initialize_params {
      image = "rhel-sap-cloud/rhel-8-8-sap-ha"
      size = 50
    }
  }
  tags = ["demo","hadoop"]
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
