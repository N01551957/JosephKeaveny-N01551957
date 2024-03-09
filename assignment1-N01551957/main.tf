module "rgroup-N01551957" {
  source   = "./modules/rgroup-N01551957"
  RG       = "N01551957-RG"
  location = "Canada Central"
}

module "network-N01551957" {
  source = "./modules/network-N01551957"

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
}

module "vmwindows-N01551957" {
  source = "./modules/vmwindows-N01551957"
}

module "common-N01551957" {
  source = "./modules/common-N01551957"

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
}

module "datadisk-N01551957" {
  source = "./modules/datadisk-N01551957"
}

module "loadbalancer-N01551957" {
  source = "./modules/loadbalancer-N01551957"
}
