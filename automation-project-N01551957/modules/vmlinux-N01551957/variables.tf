variable "common_tags" {}

variable "linux_avs" {}
variable "resource_group-linux-location" {}
variable "resource_group-linux-name" {}
variable "vm-count" {}
variable "linux-network-subnet" {}
variable "linux_name" {}
variable "Admin_username" {}
variable "Public_key" {}
variable "Private_key" {}
variable "storage_account_uri" {}

variable "OS_disk_attr" {
  type = map(string)
  default = {
    OS_Storage_account_type = "Premium_LRS"
    OS_Disk_size            = "32"
    OS_Caching              = "ReadWrite"
  }
}

variable "Linux_Publisher" {
  default = "OpenLogic"
}

variable "Linux_Offer" {
  default = "CentOS"
}

variable "Linux_Sku" {
  default = "8_5-gen2"
}

variable "Linux_Version" {
  default = "latest"
}
