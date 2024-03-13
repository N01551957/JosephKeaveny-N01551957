resource "azurerm_availability_set" "vm-availability-CentOS" {
  name                = var.linux_avs
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.common_tags
}

resource "azurerm_network_interface" "linux-nic-CentOS" {
  for_each            = var.vm-count
  name                = "CentOS_nic-${each.key}"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name
  tags                = var.common_tags

  ip_configuration {
    name                          = "IP_configuration-${each.key}"
    subnet_id                     = var.linux-network-subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub-ip-CentOS[each.key].id
  }
}

resource "azurerm_public_ip" "pub-ip-CentOS" {
  for_each            = var.vm-count
  name                = "CentOS-vm-${each.key}"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name
  sku                 = "Standard"
  allocation_method   = "Static"
  domain_name_label   = "${var.linux_name}-${each.key}"
  tags                = var.common_tags
}

resource "azurerm_linux_virtual_machine" "vmlinux-CentOS" {
  for_each            = var.vm-count
  name                = "vmlinux-CentOS-${each.key}"
  computer_name       = "computer-name-${each.key}"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name
  size                = each.value
  admin_username      = var.Admin_username

  tags = var.common_tags

  network_interface_ids = [
    azurerm_network_interface.linux-nic-CentOS[each.key].id
  ]

  admin_ssh_key {
    username   = var.Admin_username
    public_key = file(var.Public_key)
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.OS_disk_attr["OS_Caching"]
    storage_account_type = var.OS_disk_attr["OS_Storage_account_type"]
    disk_size_gb         = var.OS_disk_attr["OS_Disk_size"]
  }

  source_image_reference {
    publisher = var.Linux_Publisher
    offer     = var.Linux_Offer
    sku       = var.Linux_Sku
    version   = var.Linux_Version
  }
  boot_diagnostics {
  storage_account_uri = var.storage_account_uri
  }
}

resource "azurerm_virtual_machine_extension" "NetworkWatcher" {
  for_each             = var.vm-count
  name                 = "NetworkWatcher"
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux-CentOS[each.key].id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  depends_on = [
    azurerm_linux_virtual_machine.vmlinux-CentOS,
    null_resource.linux_provisioner,
  ]
  tags = var.common_tags
}

resource "azurerm_virtual_machine_extension" "AzureMonitor" {
  for_each             = var.vm-count
  name                 = "AzureMonitor"
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux-CentOS[each.key].id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.29"
  depends_on = [
    azurerm_linux_virtual_machine.vmlinux-CentOS,
    null_resource.linux_provisioner,
  ]
  tags = var.common_tags
}
