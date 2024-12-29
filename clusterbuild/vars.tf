variable resource_group_name {
  type=string
  default="rg-aks-westus-test"
}
variable location {
  type=string
  default="westus"
} 
variable cluster_name {
  type=string
  default="aks-westus-test"
} 
variable kubernetes_version {
  type=string
  default="1.29.9"
} 
variable node_count {
      type=number
  default=1
}
variable upgradeChannel {
  type=string
  default="stable"
} 
variable node_pool_name {
  type=string
  default="atcnodepool"
} 
variable agentCountMax {
  type=number
  default=5
} 
variable custom_vnet {
  type=bool
  default=true
} 
variable serviceCidr {
  type=string
  default="172.17.0.0/16"
} 
variable dnsServiceIP {
  type=string
  default="172.201.0.10"
} 
variable vnet_address_space {
  type=string
  default="10.0.0.0/24"
} 
variable subnet_address_prefix {
  type=string
  default="10.0.1.0/24"
} 
variable enable_aad {
  type=bool
  default=true
} 
variable AksDisableLocalAccounts {
  type=bool
  default=true
} 
variable enableAzureRBAC {
  type=bool
  default=true
} 
variable enableTelemetry {
  type=bool
  default=false
} 
variable network_plugin {
  type=string
  default="kubenet"
} 
variable podCidr {
  type=string
  default="172.16.0.0/16"
} 
variable ingressApplicationGateway {
  type=bool
  default=true
} 
variable vnetAppGatewaySubnetAddressPrefix {
  type=string
  default="10.0.1.0/24"
} 
variable appGWcount {
  type=number
  default=0
} 
variable appGWsku {
  type=string
  default="Standard_v2"
} 
variable appGWmaxCount {
  type=number
  default=3
}
variable "vnet_name" {
  type=string
}
variable "subnet_name" {
 type=string 
}
variable "node_vm_size" {
  type=string
  default="Standard_DS2_v2"
}
