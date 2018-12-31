data "template_file" "test" {
  template = "${file("./hosts.tpl")}"
  vars {
   master-ip = "${google_compute_instance.hadoop-m.network_interface.0.access_config.0.nat_ip}"
   node-ips0 = "${google_compute_instance.hadoop-n.0.network_interface.0.access_config.0.nat_ip}"
   node-ips1 = "${google_compute_instance.hadoop-n.1.network_interface.0.access_config.0.nat_ip}"
  }
}
resource "null_resource" "export_rendered_template" {
provisioner "local-exec" {
    command = "cat >host.json <<EOL\n${data.template_file.test.rendered}\nEOL"
  }
}
