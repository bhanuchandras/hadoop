[hadoop-master] 
${master-ip}  ansible_connection=ssh  ansible_ssh_user=bhanucs_2022   ansible_ssh_private_key_file=~/.ssh/google_compute_engine ansible_python_interpreter=/usr/bin/python3

[hadoop-data] 
%{ for ip in node-ips ~}
${ip}  ansible_connection=ssh  ansible_ssh_user=bhanucs_2022   ansible_ssh_private_key_file=~/.ssh/google_compute_engine ansible_python_interpreter=/usr/bin/python3
%{ endfor ~}
