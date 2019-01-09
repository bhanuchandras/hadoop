resource "google_compute_instance" "hadoop-m" {
  project      = "cloudjupyter-bhanu"
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
    source = "/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine"
    destination = "/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine"
    connection {
      type    = "ssh"
      user    = "bhanuchandra_sabbavarapu"
      timeout = "120s"
      agent       = false
      private_key = "${file("/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine")}"
    }
  }
  tags = ["http-server"]

}

resource "google_compute_firewall" "http-server" {
  name    = "new-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["50070"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

output "ip" {
  value = "${google_compute_instance.hadoop-m.network_interface.0.access_config.0.nat_ip}"
}
