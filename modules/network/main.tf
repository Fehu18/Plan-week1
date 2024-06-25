resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.env}-${var.location}-001"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "appgateway" {
  name                 = "snet-agw-${var.env}-${var.location}-001"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets.appgateway]

  service_endpoints = ["Microsoft.Web"]
}

resource "azurerm_subnet" "database" {
  name                 = "snet-db-${var.env}-${var.location}-001"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets.database]
}

resource "azurerm_subnet" "monitoring" {
  name                 = "snet-monitoring-${var.env}-${var.location}-001"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets.monitoring]
}

