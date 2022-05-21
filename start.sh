terraform init
terraform apply --auto-approve
sleep 60
ansible-playbook playbook-cm.yaml
