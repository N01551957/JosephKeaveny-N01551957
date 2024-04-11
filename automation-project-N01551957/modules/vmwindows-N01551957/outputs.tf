output "windows_vm_hostnames" {
  value = values(azurerm_windows_virtual_machine.vmwindows_1957)[*].name
}

output "windows_vm_availability" {
  value = azurerm_availability_set.windowsavailability_1957.name
}

output "windows_vm_fqdn" {
  value = values(azurerm_public_ip.win-pub-ip_1957)[*].fqdn
}

output "windows_private_ip" {
  value = values(azurerm_network_interface.windows-nic_1957)[*].private_ip_address
}

output "windows_public_ip" {
  value = values(azurerm_windows_virtual_machine.vmwindows_1957)[*].public_ip_address
}

output "windows_vm_id" {
  value = values(azurerm_windows_virtual_machine.vmwindows_1957)[*].id
}
