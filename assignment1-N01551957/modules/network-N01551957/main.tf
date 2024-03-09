resource "azurerm_virtual_network" "N01551957-VNET" {
  name                = var.vname
  location            = var.location
  resource_group_name = var.networking-rg
  address_space       = var.vnet_space

}

resource "azurerm_subnet" "N01551957-SUBNET" {
  name                 = var.subnet-name
  resource_group_name  = var.resource-group-network-name
  virtual_network_name = azurerm_virtual_network.N01551957-VNET.name
  address_prefixes     = var.subnet_space
}

resource "azurerm_network_security_group" "N01551957-SECURITY-GROUP" {
  name                = var.security_group-network-name
  location            = var.resource-group-network-location
  resource_group_name = var.resource-group-network-name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule3"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule4"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "N01551957-NSGA" {
  subnet_id                 = azurerm_subnet.N01551957-SUBNET.id
  network_security_group_id = azurerm_network_security_group.N01551957-SECURITY-GROUP.id
}
