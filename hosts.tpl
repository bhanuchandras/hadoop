[hadoop-master] 
${master-ip}  ansible_connection=ssh  ansible_ssh_user=bhanucs2021   ansible_ssh_private_key_file=~/.ssh/google_compute_engine 

[hadoop-data] 
%{ for ip in node-ips ~}
${ip}  ansible_connection=ssh  ansible_ssh_user=bhanucs2021   ansible_ssh_private_key_file=~/.ssh/google_compute_engine 
%{ endfor ~}