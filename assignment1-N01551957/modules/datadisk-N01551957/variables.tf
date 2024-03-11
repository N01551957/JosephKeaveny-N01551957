variable "common_tags" {}
variable "vm-count" {}
variable "resource-group-datadisk-location" {}
variable "resource-group-datadisk-name" {}
variable "depend_on_vmwindows_1957" {}
variable "depend_on_vmlinux_1957" {}
variable "SAT" {}
variable "CO" { default = "Empty" }
variable "DS_gb" {}        
variable "lun" { default = "10"  }    
variable "caching" { default = "ReadWrite"  }
