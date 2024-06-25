resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "law-${var.env}-${var.location}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "app_insights" {
  name                = "appinsights-${var.env}-${var.location}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  retention_in_days   = 90
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = "diag-${var.env}-${var.location}-001"
  target_resource_id         = azurerm_application_insights.app_insights.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  log {
    category = "AuditLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "SignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }
}

