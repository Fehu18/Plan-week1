variable "env" {
  description = "The environment for deployment (e.g., dev, test, prod)"
  type        = string
}

variable "location" {
  description = "The Azure location for the app service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}