module "rgroup-N01551957" {
  source   = "./modules/rgroup-N01551957"
  RG       = "N01551957-RG"
  location = "Canada Central"
}

module "network-N01551957" {
  source = "./modules/network-N01551957"
  
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Joseph.Keaveny"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  vname                           = "vnet-assignment1-N01551957"
  networking-rg                   = module.rgroup-N01551957.N01551957-RG.name
  location                        = module.rgroup-N01551957.N01551957-RG.location
  vnet_space                      = ["10.0.0.0/16"]
  subnet-name                     = "subnet"
  resource-group-network-name     = module.rgroup-N01551957.N01551957-RG.name
  subnet_space                    = ["10.0.1.0/24"]
  security_group-network-name     = "nsg"
  resource-group-network-location = module.rgroup-N01551957.N01551957-RG.location
}

module "vmlinux-N01551957" {
  source = "./modules/vmlinux-N01551957"

  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Joseph.Keaveny"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  linux_avs                     = "linux_avs"
  storage_account_uri           = module.common-N01551957.SA-N01551957.primary_blob_endpoint
  resource_group-linux-location = module.rgroup-N01551957.N01551957-RG.location
  resource_group-linux-name     = module.rgroup-N01551957.N01551957-RG.name
  vm-count = {
    centos-vm1 = "Standard_B1ms"
    centos-vm2 = "Standard_B1ms"
    centos-vm3 = "Standard_B1ms"
  }
  linux-network-subnet = module.network-N01551957.N01551957-SUBNET.id
  linux_name           = "n01551957-c-vm"
  Admin_username       = "j"
  Public_key           = "/home/j/.ssh/id_rsa.pub"
  Private_key          = "/home/j/.ssh/id_rsa"
}


module "vmwindows-N01551957" {
  source = "./modules/vmwindows-N01551957"

  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Joseph.Keaveny"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  vm_instances = {
    n01551957-w-vm1 = "Standard_B1ms"
  }
  windows_name                    = "windows-n01551957"
  windows_avs                     = "windows_avs"
  Admin_username_win              = "j"
  Public_key_win                  = "/home/j/.ssh/id_rsa.pub"
  storage_account_uri             = module.common-N01551957.SA-N01551957.primary_blob_endpoint
  resource-group-windows-location = module.rgroup-N01551957.N01551957-RG.location
  resource-group-windows-name     = module.rgroup-N01551957.N01551957-RG.name
  windows-network-subnet          = module.network-N01551957.N01551957-SUBNET.id
}

module "common-N01551957" {
  source = "./modules/common-N01551957"
  
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Joseph.Keaveny"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  
  LAW_name                    = "acctest"
  LAW_location                = module.rgroup-N01551957.N01551957-RG.location
  LAW_rg_name                 = module.rgroup-N01551957.N01551957-RG.name
  LAW_sku                     = "PerGB2018"
  retnetion_in_days           = 30
  RSV_name                    = "N01551957recoveryvault"
  RSV_location                = module.rgroup-N01551957.N01551957-RG.location
  RSV_rg_name                 = module.rgroup-N01551957.N01551957-RG.name
  RSV_sku                     = "Standard"
  SA_name                     = "n01551957joseph"
  SA_RG_name                  = module.rgroup-N01551957.N01551957-RG.name
  SA_RG_location              = module.rgroup-N01551957.N01551957-RG.location
  SA_account_tier             = "Standard"
  SA_account_replication_type = "LRS"
}

module "database-N01551957" {
  source = "./modules/database-N01551957"

  db_name                 = "assignment1db"
  resource_group_location = module.rgroup-N01551957.N01551957-RG.location
  resource_group_name     = module.rgroup-N01551957.N01551957-RG.name
  admin_login             = "psqladmin"
  admin_passwd            = "H@Sh1CoR3!"


}

module "datadisk-N01551957" {
  source = "./modules/datadisk-N01551957"

  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Joseph.Keaveny"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  vm-count = {
    "centos-vm1"  = module.vmlinux-N01551957.CentOS_vm_id[0]
    "centos-vm2"  = module.vmlinux-N01551957.CentOS_vm_id[1]
    "centos-vm3"  = module.vmlinux-N01551957.CentOS_vm_id[2]
    "windows-vm1" = module.vmwindows-N01551957.windows_vm_id[0]
  }
  resource-group-datadisk-location = module.rgroup-N01551957.N01551957-RG.location
  resource-group-datadisk-name     = module.rgroup-N01551957.N01551957-RG.name
  depend_on_vmwindows_1957         = module.vmwindows-N01551957.windows_vm_hostnames
  depend_on_vmlinux_1957           = module.vmlinux-N01551957.CentOS_vm_hostnames
  SAT                              = "Standard_LRS"
  DS_gb                            = "10"
}

module "loadbalancer-N01551957" {
  source = "./modules/loadbalancer-N01551957"

  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Joseph.Keaveny"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  vm-count = {
    "centos-vm1" = module.vmlinux-N01551957.CentOS_vm_id[0]
    "centos-vm2" = module.vmlinux-N01551957.CentOS_vm_id[1]
    "centos-vm3" = module.vmlinux-N01551957.CentOS_vm_id[2]
  }
  lb_name                 = "assignment1_LB_1957"
  LB_Sku                  = "Standard"
  depend_on_linux_avs     = module.vmlinux-N01551957.CentOS_vm_linux_availability
  resource_group_location = module.rgroup-N01551957.N01551957-RG.location
  resource_group_name     = module.rgroup-N01551957.N01551957-RG.name
  nic_ids = {
    "centos-vm1" = module.vmlinux-N01551957.Centos_nic_id[0]
    "centos-vm2" = module.vmlinux-N01551957.Centos_nic_id[1]
    "centos-vm3" = module.vmlinux-N01551957.Centos_nic_id[2]
  }
  depend_on_vmlinux_1957 = module.vmlinux-N01551957.CentOS_vm_hostnames
}
