<p>
In todays scenario we can use Google data proc which we do all this set up on in few mins a big data cluster.
In case if you want to see how the whole hadoop cluster set up will be done in step by step manner you can follow this repo to do the same
</p>
<h2> Building HDFS file system with terraform and ansible </h2>
  We are using GCP (Google cloud platform) for the demo
  Devops Tools used are
  <li> terraform
  <li> Ansible
<br>
<h3> Infrastructre </h3> 
  Building the infrastructure from ground zero needs provisioning which can be done by terraform.
<br>
   
<code>
  terraform init <br>
  terraform apply 
</code>
<br>
  will do the job of provisioning the VM's
  <br>
 <h3> Provisioning </h3>
  In Provisioning Ansible will do most of the part with minimal installation 
  i am using cloud-shell / laptop with ansible installation and using ansible we can do 
  <li> User creation
  <li> password less ssh set up
  <li> installing java & hadoop
  <li> templaing the config file.
  <li> enabling stackdriver to index the hadoop logs.
  <br>
  Similar can be done with any of the config management tools, but Ansible set up is easy and with less overhead can be done.
<br>
<code>
  ansible-playbook playbook-name.yaml
</code>
                                                            
