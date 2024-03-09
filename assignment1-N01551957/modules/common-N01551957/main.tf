resource "azurerm_log_analytics_workspace" "LAW-N01551957" {
  name                = var.LAW_name
  location            = var.LAW_location
  resource_group_name = var.LAW_rg_name 
  sku                 = var.LAW_sku
  retention_in_days   = var.retnetion_in_days
}

resource "azurerm_recovery_services_vault" "RSV-N01551957" {
  name                = var.RSV_name 
  location            = var.RSV_location 
  resource_group_name = var.RSV_rg_name 
  sku                 = var.RSV_sku

  soft_delete_enabled = true
}

resource "azurerm_storage_account" "SA-N01551957" {
  name                     = var.SA_name 
  resource_group_name      = var.SA_RG_name 
  location                 = var.SA_RG_location 
  account_tier             = var.SA_account_tier 
  account_replication_type = var.SA_account_replication_type

  tags = {
    environment = "staging"
  }
}
