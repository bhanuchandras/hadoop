[hadoop-master] 
${master-ip} ansible_connection=ssh  ansible_ssh_user=bhanuchandra_sabbavarapu   ansible_ssh_private_key_file=~/.ssh/google_compute_engine 

[hadoop-data] 
${node-ips0}              ansible_connection=ssh  ansible_ssh_user=bhanuchandra_sabbavarapu   ansible_ssh_private_key_file=~/.ssh/google_compute_engine 
${node-ips1}              ansible_connection=ssh  ansible_ssh_user=bhanuchandra_sabbavarapu   ansible_ssh_private_key_file=~/.ssh/google_compute_engine 
