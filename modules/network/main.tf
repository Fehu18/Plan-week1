resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}-vnet"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "appgateway" {
  name                 = "${var.env}-appgateway-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets.appgateway]

  service_endpoints = ["Microsoft.Web"]
}

resource "azurerm_subnet" "database" {
  name                 = "${var.env}-database-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets.database]
}

resource "azurerm_subnet" "monitoring" {
  name                 = "${var.env}-monitoring-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets.monitoring]
}

