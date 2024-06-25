# Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  env      = var.env
  location = var.location
}

# Network
module "network" {
  source              = "./modules/network"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
}

# Application Gateway
module "application_gateway" {
  source              = "./modules/application_gateway"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.network.appgateway_subnet_id
}

# Azure Web App Services
module "app_service" {
  source              = "./modules/app_service"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
}

# CosmosDB
module "cosmosdb" {
  source              = "./modules/cosmosdb"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
}

# Key Vault
module "key_vault" {
  source              = "./modules/key_vault"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
}

# Azure AD B2C
module "adb2c" {
  source              = "./modules/adb2c"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
}

# Monitoring (Azure Monitor, Log Analytics, Application Insights)
module "monitoring" {
  source              = "./modules/monitoring"
  env                 = var.env
  location            = var.location
  resource_group_name = module.resource_group.name
}
