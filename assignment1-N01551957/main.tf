module "rgroup" {
  source = "./modules/rgroup-N01551957"
}

module "network" {
  source = "./modules/network-N01551957"
}

module "linux" {
  source = "./modules/vmlinux-N01551957"
}

module "windows" {
  source = "./modules/vmwindows-N01551957"
}

module "common" {
  source = "./modules/common-N01551957"
}

module "database" {
  source = "./modules/database-N01551957"
}

module "datadisk" {
  source = "./modules/datadisk-N01551957"
}

module "loadbalancer" {
  source = "./modules/loadbalancer-N01551957"
}

