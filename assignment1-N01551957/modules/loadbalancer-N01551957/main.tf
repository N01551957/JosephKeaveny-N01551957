resource "azurerm_public_ip" "load_balancer_public_ip_1957" {
  name                = var.lb_name 
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "load_balancer_1957" {
  name                = "TestLoadBalancer"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  
  tags = var.common_tags

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.load_balancer_public_ip_1957.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool_1957" {
  name                = "${var.lb_name}-backend-pool"
  loadbalancer_id     = azurerm_lb.load_balancer_1957.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_pool_association_1957" {
  for_each              = var.vm-count   
  network_interface_id  = var.nic_ids 
  ip_configuration_name = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool_1957.id
}

resource "azurerm_lb_probe" "health_probe_1957" {
  name                = "${var.lb_name}-probe"
  loadbalancer_id     = azurerm_lb.load_balancer_1957.id
  protocol            = "Tcp"
  port                = 80
}

resource "azurerm_lb_rule" "lb_rule_1957" {
  for_each              = var.vm-count
  name                = "${var.lb_name}-rule"
  loadbalancer_id     = azurerm_lb.load_balancer_1957.id
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = azurerm_lb_backend_address_pool.lb_backend_pool_1957.id
  probe_id                      = azurerm_lb_probe.health_probe_1957.id

  protocol    = "Tcp"
  frontend_port   = 80
  backend_port    = 80
}
