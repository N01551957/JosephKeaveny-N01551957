output "LOADBALANCER_PUBLIC_IP" {
  value = azurerm_public_ip.load_balancer_public_ip_1957
}
output "LOADBALANCER" {
  value = azurerm_lb.load_balancer_1957
}
output "LOADBALANCER_ADR_POOL" {
  value = azurerm_lb_backend_address_pool.lb_backend_pool_1957
}
output "LOADBALANCER_ADR_POOL_ASSOCIATION" {
  value = azurerm_network_interface_backend_address_pool_association.nic_backend_pool_association_1957
}
output "LOADBALANCER_HEALTH_PROBE" {
  value = azurerm_lb_probe.health_probe_1957
}
output "LOADBALANCER_RULE" {
  value = azurerm_lb_rule.lb_rule_1957
}
