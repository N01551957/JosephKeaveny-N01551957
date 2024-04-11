resource "azurerm_postgresql_server" "DB_1957" {
  name                = var.db_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_passwd

  sku_name   = "GP_Gen5_4"
  version    = "11"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}
