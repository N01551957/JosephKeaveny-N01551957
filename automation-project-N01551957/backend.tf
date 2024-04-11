terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01551957RG"
    storage_account_name = "tfstaten01551957sa"
    container_name       = "tfstateassignment1files"
    key                  = "KyTLgSJSW7lYehuiuVjc6FuhkBGtAGlWcOd6IseuDLcq9D8TafMvAjtQ9JenqqRCt/0Eb17Cqtw3+AStQtDAcw=="
  }
}
