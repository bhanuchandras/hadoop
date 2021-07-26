resource "local_file" "AnsibleInventory" {
 content = templatefile("hosts.tpl",
 {
        master-ip = google_compute_instance.hadoop-m.network_interface.0.access_config.0.nat_ip,
        node-ips = google_compute_instance.hadoop-n.*.network_interface.0.access_config.0.nat_ip
 }
 )
 filename = "host.cfg"
}
