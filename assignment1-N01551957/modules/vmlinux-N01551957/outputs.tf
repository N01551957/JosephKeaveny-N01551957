output "CentOS_vm_hostnames" {
  value = values(azurerm_linux_virtual_machine.vmlinux-CentOS)[*].name
}

output "CentOS_vm_linux_availability" {
  value = azurerm_availability_set.vm-availability-CentOS.name
}

output "CentOS_vm_fqdn" {
  value = values(azurerm_public_ip.pub-ip-CentOS)[*].fqdn
}

output "CentOS_public_ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux-CentOS)[*].public_ip_address
}

output "CentOS_private_ip" {
  value = values(azurerm_network_interface.linux-nic-CentOS)[*].private_ip_address
}

output "CentOS_nic" {
  value = values(azurerm_network_interface.linux-nic-CentOS)[*].name
}
