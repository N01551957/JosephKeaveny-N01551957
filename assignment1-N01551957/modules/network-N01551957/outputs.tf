output "network-vnet" {
  value = azurerm_virtual_network.N01551957-VNET
}

output "network-subnet" {
  value = azurerm_subnet.N01551957-SUBNET
}

output "network-nsg" {
  value = azurerm_network_security_group.N01551957-SECURITY-GROUP
}
