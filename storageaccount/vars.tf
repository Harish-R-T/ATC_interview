variable "resource_group_name" {
  description = "the resource group of all resources"
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources should be provisioned"
  type        = string
}

variable "azurerm_storage_container" {
  description = "The storage account name container name"
  type = string
}

variable "azurerm_storage_account" {
  description = "The storage account name"
  type = string
}

variable "account_tier" {
  default = "Standard"
  type = string
}

variable "account_replication_type" {
  default = "LRS"
}
