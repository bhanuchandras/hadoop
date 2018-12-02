resource "google_compute_instance" "hadoop" {
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

output "ip" {
  value = "${join(",", google_compute_instance.hadoop.*.network_interface.0.address)}"
}

output "ips" {
  value = ["${google_compute_instance.hadoop.*.network_interface.0.address}"]
}


resource "null_resource" "hadoop" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers {
    cluster_instance_ids = "${join(",", google_compute_instance.hadoop.*.id)}"
  }

  connection {
    host = "${element(google_compute_instance.hadoop.*.network_interface.0.access_config.0.nat_ip, count.index)}"
  }

  provisioner "remote-exec" {
      inline = [
        "cat /etc/hosts",
        "echo '${google_compute_instance.hadoop.0.network_interface.0.address} hadoop-001' >> /etc/hosts ",
        "echo '${google_compute_instance.hadoop.1.network_interface.0.address} hadoop-002' >> /etc/hosts ",
        "echo '${google_compute_instance.hadoop.2.network_interface.0.address} hadoop-003' >> /etc/hosts ",
      ]
  }
}
