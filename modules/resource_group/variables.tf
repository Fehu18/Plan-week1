variable "env" {
  description = "The environment for deployment (e.g., dev, test, prod)"
  type        = string
}

variable "location" {
  description = "The Azure location for all resources"
  type        = string
}