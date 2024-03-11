output "N01551957-DATADISK" {
  value = values(azurerm_managed_disk.datadisk_1957)[*].name
}
output "N01551957-DATADISK-ATTATCHMENT" {
  value = values(azurerm_virtual_machine_data_disk_attachment.datadisk_attatchment_1957)[*].id
}
