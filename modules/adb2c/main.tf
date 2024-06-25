# resource "azurerm_active_directory_b2c_directory" "b2c_directory" {
#   name                = "adb2c-${var.env}-${var.location}-001"
#   location            = var.location
#   sku                 = "Standard"
#   resource_group_name = var.resource_group_name
# }

resource "azurerm_aadb2c_directory" "b2c_directory" {
  data_residency_location = "United States"
  display_name            = "adb2c-${var.env}-${var.location}-001"
  domain_name             = "poojithaweek1b2ctenant.onmicrosoft.com"
  resource_group_name     = var.resource_group_name
  sku_name                = "PremiumP1"
}