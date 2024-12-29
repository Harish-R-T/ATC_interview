terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {} 
}

resource "azurerm_resource_group" "tf_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tf_storage_account" {
  name                     = var.azurerm_storage_account
  resource_group_name      = azurerm_resource_group.tf_rg.name
  location                 = azurerm_resource_group.tf_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    Environment = "Terraform State"
  }
}

resource "azurerm_storage_container" "tf_container" {
  name                  = var.azurerm_storage_container
  storage_account_id    = azurerm_storage_account.tf_storage_account.id
  container_access_type = "private"
}
