terraform {
  backend "azurerm" {
    resource_group_name = "rg-tf-aks-westus-test"
    storage_account_name = "tfakswestus"
    container_name = "fstakswestus"
    key = "tfstatefile.tfstate"
  }
}
