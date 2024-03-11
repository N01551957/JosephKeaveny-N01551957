output "resource_group_N01551957-RG_name" {
  value = module.rgroup-N01551957.N01551957-RG.name
}
output "resource_group_N01551957-RG_location" {
  value = module.rgroup-N01551957.N01551957-RG.location
}


output "network-N01551957_network-vnet_name" {
  value = module.network-N01551957.N01551957-VNET.name
}
output "network-N01551957_network-subnet_name" {
  value = module.network-N01551957.N01551957-SUBNET.name
}


output "common-N01551957_LAW-N01551957_name" {
  value = module.common-N01551957.LAW-N01551957.name
}
output "common-N01551957_RSV-N01551957_name" {
  value = module.common-N01551957.RSV-N01551957.name
}
output "common-N01551957_SA-N01551957_name" {
  value = module.common-N01551957.SA-N01551957.name
}


output "CentOS_vm_hostnames" {
  value = module.vmlinux-N01551957.CentOS_vm_hostnames
}
output "CentOS_vm_linux_availability" {
  value = module.vmlinux-N01551957.CentOS_vm_linux_availability
}
output "CentOS_vm_FQDNs" {
  value = module.vmlinux-N01551957.CentOS_vm_fqdn
}
output "CentOS_public_ips" {
  value = module.vmlinux-N01551957.CentOS_public_ip
}
output "CentOS_private_ips" {
  value = module.vmlinux-N01551957.CentOS_private_ip
}
output "CentOS_virtual_network_names" {
  value = module.vmlinux-N01551957.CentOS_nic
}



output "windows_vm_hostnames" {
  value = module.vmwindows-N01551957.windows_vm_hostnames
}

output "windows_vm_availability" {
  value = module.vmwindows-N01551957.windows_vm_availability
}

output "windows_vm_fqdn" {
  value = module.vmwindows-N01551957.windows_vm_fqdn
}

output "windows_private_ip" {
  value = module.vmwindows-N01551957.windows_private_ip
}

output "windows_public_ip" {
  value = module.vmwindows-N01551957.windows_public_ip
}



output "N01551957-DATADISK" {
  value = module.datadisk-N01551957.N01551957-DATADISK
}
output "N01551957-DATADISK-ATTATCHMENT" {
  value = module.datadisk-N01551957.N01551957-DATADISK-ATTATCHMENT
}
