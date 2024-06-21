resource "azurerm_active_directory_b2c_directory" "b2c_directory" {
  name                = "${var.env}-adb2c"
  location            = var.location
  sku                 = "Standard"
  resource_group_name = var.resource_group_name
}

output "tenant_id" {
  value = azurerm_active_directory_b2c_directory.b2c_directory.tenant_id
}
