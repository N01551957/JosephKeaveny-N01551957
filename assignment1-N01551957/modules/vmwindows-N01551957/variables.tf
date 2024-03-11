variable "common_tags" {}
variable "windows_name" {}
variable "vm_instances" {}
variable "windows_avs" {}
variable "Admin_username_win" {}
variable "Public_key_win" {}
variable "resource-group-windows-location" {}
variable "resource-group-windows-name" {}
variable "windows-network-subnet" {}

variable "OS_win_disk_attr" {
  type = map(string)
  default = {
    OS_Storage_account_type = "StandardSSD_LRS"
    OS_Disk_size            = "128"
    OS_Caching              = "ReadWrite"
  }
}

variable "Windows_Publisher" {
  default = "MicrosoftWindowsServer"
}

variable "Windows_Offer" {
  default = "WindowsServer"
}

variable "Windows_Sku" {
  default = "2016-Datacenter"
}

variable "Windows_Version" {
  default = "latest"
}
