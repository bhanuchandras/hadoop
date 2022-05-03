resource "google_compute_instance" "hadoop-m" {
  project      = "maximal-beach-340105"
  machine_type = "e2-standard-8"
  zone         = "us-central1-a"
  name = "hadoop-master"
 
  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-8"
      size  = 70
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }

  tags = ["http-server","demo","hadoop"]
    service_account {
    scopes = ["cloud-platform"]
  }

}