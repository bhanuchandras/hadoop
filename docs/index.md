
<h2> Building HDFS file system with terraform and ansible </h2>
  We are using GCP (Google cloud platform) for the demo
  Devops Tools used are
  <li> terraform
  <li> Ansible

<h3> Infrastructre </h3> 
  Building the infrastructure from ground zero needs provisioning which can be done by terraform .
  terraform init
  terraform apply 
  
  will do the job of provisioning the VM's
  
 <h3> Provisioning </h3>
  In Provisioning Ansible will do most of the part with minimal installation 
  i am using cloud-shell / laptop with ansible installation and using ansible we can do 
  <li> User creation
  <li> ssh set up
  <li> installing java & hadoop
  <li> templaing the config file.
    
  
                                                            
