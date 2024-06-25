output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "appgateway_subnet_id" {
  value = azurerm_subnet.appgateway.id
}

output "database_subnet_id" {
  value = azurerm_subnet.database.id
}

output "monitoring_subnet_id" {
  value = azurerm_subnet.monitoring.id
}