resource "null_resource" "etc_hosts" {

  depends_on = ["google_compute_instance.hadoop-n"]

  ##Create Masters Inventory
  provisioner "local-exec" {
    command =  "echo \"${google_compute_instance.hadoop-n.1.network_interface.0.address}\" > etc_hosts"
  }
}
