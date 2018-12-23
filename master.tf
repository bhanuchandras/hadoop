resource "google_compute_instance" "hadoop-m" {
  project      = "cloudjupyter-bhanu"
  machine_type = "g1-small"
  zone         = "asia-south1-c"
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
    source = "hosts"
    destination = "/tmp/hosts"
    connection {
      type    = "ssh"
      user    = "bhanuchandra_sabbavarapu"
      timeout = "120s"
      agent       = false
      private_key = "${file("/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine")}"
    }
  }
  provisioner "file" {
    source = "playbook.yaml"
    destination = "/home/bhanuchandra_sabbavarapu/playbook.yaml"
    connection {
      type    = "ssh"
      user    = "bhanuchandra_sabbavarapu"
      timeout = "120s"
      agent       = false
      private_key = "${file("/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine")}"
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
  provisioner "remote-exec" {
    connection {
      type    = "ssh"
      user    = "bhanuchandra_sabbavarapu"
      timeout = "120s"
      agent       = false
      private_key = "${file("/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine")}"
    }
    inline = [
      "sudo yum install -y ansible",
      "sudo mv /tmp/hosts /etc/ansible/hosts"
    ]
  }
}

output "master-ips" {
  value = ["${google_compute_instance.hadoop-m.*.network_interface.0.address}"]
}
