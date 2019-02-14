# Terraform + ansible steps to add a hadoop cluster

This project uses terraform for provisioning the infrastructure and anisble for building the software.

Uses GCP for VM.

* building 1 Master and 2 slave/nodes VM's using terraform
* using Ansible
  * set up passwordless ssh
  * install java and set up java_home
  * installing hadoop 
  * install fluentd and set up stackdriver indexing
 
 By the end you will have zero to hdfs cluster set up done.
