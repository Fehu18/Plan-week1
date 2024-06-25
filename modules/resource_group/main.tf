resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env}-${var.location}-001"
  location = var.location
}