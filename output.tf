output "resource_group" {
  value = "${var.azure_resource_group}"
}

output "rancher_node" {
  value = "${azurerm_public_ip.rancher_publicip.ip_address}"
}
output "etcd_nodes" {
  value = "${azurerm_public_ip.etcd_publicip.*.ip_address}"
}

output "etcd_node_names" {
  value = "${azurerm_virtual_machine.etcd-machine.*.name}"
}

output "controlplane_nodes" {
  value = "${azurerm_public_ip.controlplane_publicip.*.ip_address}"
}

output "controlplane_node_names" {
  value = "${azurerm_virtual_machine.controlplane-machine.*.name}"
}

output "worker_nodes" {
  value = "${azurerm_public_ip.worker_publicip.*.ip_address}"
}

output "worker_node_names" {
  value = "${azurerm_virtual_machine.worker-machine.*.name}"
}

output "admin" {
  value = "${var.administrator_username}"
}

output "ssh" {
  value = "${var.administrator_ssh}"
}

output "administrator_ssh_private" {
  value = "${var.administrator_ssh_private}"
}

output "rancher_hostname" {
  value = "${var.rancher_hostname}"
}
