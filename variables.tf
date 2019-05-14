# Authorization Variables for the Terraform Azure Provider
variable "azure_service_principal" {
  type        = "map"
  description = "Azure Service Principal under which Terraform will be executed."

  default = {
    subscription_id = "c7e23d24-5dcd-4c7c-ae84-22f6f814dc02"
    client_id       = "d1e36760-3411-4bec-9bc1-895074e3a3e6"
    client_secret   = "77a179bd-08d1-4bf2-a165-615ef7792ffa"
    tenant_id       = "5508dba5-ea44-4881-b6b6-e991cc57520c"
    environment     = "public"
  }
}

variable "azure_region" {
  type        = "string"
  description = "Azure region where all infrastructure will be provisioned."

  default = "East US"
}

variable "azure_resource_group" {
  type        = "string"
  description = "Name of the Azure Resource Group to be created for the network."

  default = "windows-demo"
}

variable "rancher_node_vm_size" {
  type        = "string"
  description = "Azure VM size of the worker nodes"

  default = "Standard_DS2_v2"
}

variable "worker_node_vm_size" {
  type        = "string"
  description = "Azure VM size of the worker nodes"

  default = "Standard_DS2_v2"
}

variable "controlplane_node_vm_size" {
  type        = "string"
  description = "Azure VM size of the control plane nodes"

  default = "Standard_DS2_v2"
}

variable "etcd_node_vm_size" {
  type        = "string"
  description = "Azure VM size of the worker nodes"

  default = "Standard_DS2_v2"
}

variable "windows_node_vm_size" {
  type        = "string"
  description = "Azure VM size of the windows nodes"
  
  default = "Standard_D4_v3"
}


# Counts of desired node types
variable "worker_count" {
  type        = "string"
  description = "Number of workers to be created by Terraform."

  default = "1"
}

variable "controlplane_count" {
  type        = "string"
  description = "Number of control plane nodes to be created by Terraform."

  default = "1"
}

variable "etcd_count" {
  type        = "string"
  description = "Number of etcd nodes to be created by Terraform."

  default = "1"
}

variable "windows_count" {
  type        = "string"
  description = "Number of windowds ndoes to be created by Terraform."

  default = "1"
}


# Administrator Credentials
variable "administrator_username" {
  type        = "string"
  description = "Administrator account name on the linux nodes."
}

variable "administrator_password" {
  type        = "string"
  description = "Password for administrator account on the windows nodes."
}


variable "administrator_ssh" {
  type        = "string"
  description = "SSH Public Key for the Administrator account."
}

variable "administrator_ssh_private" {
  type        = "string"
  description = "The path to the SSH Private Key file."
}


# Rancher 
variable "rancher_hostname" {
  type = "string"
  description = "Resolvable DNS Name or IP Address of the Rancher Server"
}
