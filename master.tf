resource "google_compute_instance" "hadoop-m" {
  project      = "datacloud-20220501"
  machine_type = "e2-standard-4"
  zone         = "us-west2-a"
  name = "hadoop-master"
 
  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-8"
      size  = 50
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
