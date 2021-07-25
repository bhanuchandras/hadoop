resource "google_compute_instance" "hadoop-m" {
  project      = "nimble-ally-320910"
  machine_type = "g1-small"
  zone         = "asia-south1-a"
  name = "hadoop-master"

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
  provisioner "file" {
    source = "/home/bhanucs2021/.ssh/google_compute_engine"
    destination = "/home/bhanucs2021/.ssh/google_compute_engine"
    connection {
      type    = "ssh"
      user    = "bhanucs2021"
      timeout = "120s"
      host    = "${google_compute_instance.hadoop-m.network_interface.0.access_config.0.nat_ip}"
      agent       = false
      private_key = "${file("/home/bhanucs2021/.ssh/google_compute_engine")}"
    }
  }
  tags = ["http-server"]

}

resource "google_compute_firewall" "http-server" {
  name    = "new-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9870","8088","8032"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

