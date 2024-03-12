resource "azurerm_managed_disk" "datadisk_1957" {
  for_each             = var.vm-count
  name                 = "${each.key}_datadisk_n01551957"
  location             = var.resource-group-datadisk-location
  resource_group_name  = var.resource-group-datadisk-name
  storage_account_type = var.SAT
  create_option        = var.CO
  disk_size_gb         = var.DS_gb
  depends_on = [
    var.depend_on_vmwindows_1957,
    var.depend_on_vmlinux_1957,
  ]
  tags = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attatchment_1957" {
  for_each           = var.vm-count
  managed_disk_id    = azurerm_managed_disk.datadisk_1957[each.key].id
  virtual_machine_id = each.value
  lun                = var.lun
  caching            = var.caching
  depends_on = [
    azurerm_managed_disk.datadisk_1957
  ]
}
