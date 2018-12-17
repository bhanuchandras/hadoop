resource "null_resource" "etc_hosts_local" {

  depends_on = ["google_compute_instance.hadoop-n"]

  ##Create Masters Inventory
  provisioner "local-exec" {
    command =  "echo \"${google_compute_instance.hadoop-n.1.network_interface.0.address}\"  \"${google_compute_instance.hadoop-n.1.id}\"  > etc_hosts; echo \"${google_compute_instance.hadoop-n.0.network_interface.0.address}\"  \"${google_compute_instance.hadoop-n.0.id}\"  >> etc_hosts"
  }
}
resource "null_resource" "etc_hosts" {

  depends_on = ["null_resource.etc_hosts_local"]

  ##Create Masters Inventory
  provisioner "file" {
     source="etc_hosts"
     destination="/tmp/etc_hosts"
    connection {
      host    = "${google_compute_instance.hadoop-m.id}"
      type    = "ssh"
      user    = "bhanuchandra_sabbavarapu"
      timeout = "120s"
      agent       = false
      private_key = "${file("/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine")}"
    }
  }
}
resource "null_resource" "ansible" {

  depends_on = ["google_compute_instance.hadoop-m","null_resource.etc_hosts"]

  ##Create Masters Inventory
  provisioner "remote-exec" {
inline = [
      "sudo cat /tmp/etc_hosts >> /etc/hosts",
      "ansible all -m ping"
    ]
    connection {
      host    = "${google_compute_instance.hadoop-m.id}"
      type    = "ssh"
      user    = "bhanuchandra_sabbavarapu"
      timeout = "120s"
      agent       = false
      private_key = "${file("/home/bhanuchandra_sabbavarapu/.ssh/google_compute_engine")}"
    }
  }
}
