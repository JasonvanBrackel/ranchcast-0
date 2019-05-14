#!/bin/bash
# Variables
email='jason@vanbrackel.net'
environment='staging'

#Provision Nodes in Azure
terraform apply -auto-approve
terraform apply # Seems to be an issue with the azure provider where publicips aren't there.  Will research later.
terraform output -json > output.json

# Grab ssh variables
admin=$(cat output.json | jq '.admin.value' | sed 's/\"//g')
private_key_path=$(cat output.json | jq '.administrator_ssh_private.value' | sed 's/\"//g')
private_key_path2=$(echo $private_key_path | sed 's/\//\\\//g')
rke_version=$(cat output.json | jq '.rke_version.value' | sed 's/\"//g')
helm_version=$(cat output.json | jq '.helm_version.value' | sed 's/\"//g')
resource_group_name=$(cat output.json | jq '.resource_group.value' | sed 's/\"//g')

# Grab rancher variables
rancher_hostname=$(cat output.json | jq '.rancher_hostname.value' | sed 's/\"//g')

#Remove any existing Service Principal with the same name
az ad app delete --id http://$rancher_hostname

# Create a Service Principal 
resource_group=$(az group show -n $resource_group_name  | jq '.id' | sed -e 's/\"//g')
subscription_id=$(echo $resource_group | awk -F/ '{print $3}')
service_principal=$(az ad sp create-for-rbac --name "$rancher_hostname" --role Contributor --scopes $resource_group --subscription $subscription_id)
client_id=$(echo $service_principal | jq '.appId') 
tenant_id=$(echo $service_principal | jq '.tenant')
client_secret=$(echo $service_principal | jq '.password')

# Install Docker
cat output.json | jq '.controlplane_nodes.value[],.etcd_nodes.value[],.worker_nodes.value[],.rancher_node.value' | xargs -I%  ssh -oStrictHostKeyChecking=no -i $private_key_path $admin@% "curl https://releases.rancher.com/install-docker/18.09.sh | sh && sudo usermod -a -G docker $admin"
