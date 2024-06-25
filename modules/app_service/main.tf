# resource "azurerm_service_plan" "asp" {
#   name                = "asp-${var.env}-${var.location}-001"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   os_type = "Linux"
#   size = "S1"
# }

resource "azurerm_service_plan" "asp" {
  name                = "asp-${var.env}-${var.location}-001"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_app_service" "app" {
  name                = "appservice-${var.env}-${var.location}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.asp.id

  site_config {
    linux_fx_version = "NODE|12-lts"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}