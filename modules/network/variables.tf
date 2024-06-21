variable "env" {
  description = "The environment for deployment (e.g., dev, test, prod)"
  type        = string
}

variable "location" {
  description = "The Azure location for the network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "address_space" {
  description = "The address space for the VNet"
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "A map of subnet names to CIDR blocks"
  default = {
    appgateway = "10.0.1.0/24"
    database   = "10.0.2.0/24"
    monitoring = "10.0.3.0/24"
  }
}