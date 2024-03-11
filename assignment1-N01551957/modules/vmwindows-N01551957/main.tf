resource "azurerm_availability_set" "windowsavailability_1957" {
  name                = var.windows_avs
  location            = var.resource-group-windows-location
  resource_group_name = var.resource-group-windows-name

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.common_tags
}

resource "azurerm_network_interface" "windows-nic_1957" {
  for_each            = var.vm_instances
  name                = var.windows_name
  location            = var.resource-group-windows-location
  resource_group_name = var.resource-group-windows-name
  tags = var.common_tags
  ip_configuration {
    name      = "${each.key}-ipconfig"
    subnet_id = var.windows-network-subnet

    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win-pub-ip_1957[each.key].id
  }
}

resource "azurerm_public_ip" "win-pub-ip_1957" {
  for_each              = var.vm_instances
  name                  = var.windows_name
  resource_group_name = var.resource-group-windows-name
  location            = var.resource-group-windows-location
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-domain-name-label"
  tags = var.common_tags
}

resource "azurerm_windows_virtual_machine" "vmwindows_1957" {
  for_each            = var.vm_instances
  name                = var.windows_name
  computer_name       = each.key
  resource_group_name = var.resource-group-windows-name
  location            = var.resource-group-windows-location
  size                = each.value
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  tags = var.common_tags
  winrm_listener {
    protocol = "Http"
  }

  network_interface_ids = [
    azurerm_network_interface.windows-nic_1957[each.key].id
  ]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.OS_win_disk_attr["OS_Caching"]
    storage_account_type = var.OS_win_disk_attr["OS_Storage_account_type"]
    disk_size_gb         = var.OS_win_disk_attr["OS_Disk_size"]
  }

  source_image_reference {
    publisher = var.Windows_Publisher
    offer     = var.Windows_Offer
    sku       = var.Windows_Sku
    version   = var.Windows_Version
  }
}

resource "azurerm_virtual_machine_extension" "antimalware_extension_1957" {
  for_each              = var.vm_instances
  name                  = "AntimalwareExtension-${each.key}"
  virtual_machine_id    = azurerm_windows_virtual_machine.vmwindows_1957[each.key].id
  publisher             = "Microsoft.Azure.Security"
  type                  = "IaaSAntimalware"
  type_handler_version  = "1.3"
  depends_on = [
     azurerm_windows_virtual_machine.vmwindows_1957    
  ]
  tags = var.common_tags

  settings = <<SETTINGS
{
"AntimalwareEnabled": true
}
  SETTINGS


}
