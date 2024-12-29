terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.48"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${var.cluster_name}-dns"

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.node_vm_size
    node_count = var.node_count
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = var.kubernetes_version
  network_profile {
    network_plugin    = var.network_plugin
    service_cidr      = var.serviceCidr
    dns_service_ip    = var.dnsServiceIP
    pod_cidr = var.podCidr
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
  sensitive = true
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
