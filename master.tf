resource "google_compute_instance" "hadoop-m" {
  project      = "dl-9953189580"
  machine_type = "e2-standard-4"
  zone         = "us-west2-a"
  name = "hadoop-master"
 
  boot_disk {
    initialize_params {
      image = "rhel-sap-cloud/rhel-8-8-sap-ha"
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
