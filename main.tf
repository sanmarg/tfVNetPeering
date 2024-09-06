provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "sanmarg" {
  name     = "dev-rg-vnet-peering"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet_a" {
  name                = "dev-vnet-a"
  resource_group_name = azurerm_resource_group.sanmarg.name
  location            = azurerm_resource_group.sanmarg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet_a" {
  name                 = "dev-subnet-a"
  resource_group_name  = azurerm_resource_group.sanmarg.name
  virtual_network_name = azurerm_virtual_network.vnet_a.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "vnet_b" {
  name                = "dev-vnet-b"
  resource_group_name = azurerm_resource_group.sanmarg.name
  location            = azurerm_resource_group.sanmarg.location
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet_b" {
  name                 = "dev-subnet-b"
  resource_group_name  = azurerm_resource_group.sanmarg.name
  virtual_network_name = azurerm_virtual_network.vnet_b.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_virtual_network_peering" "peer_a_to_b" {
  name                      = "dev-vnet-a-to-vnet-b"
  resource_group_name        = azurerm_resource_group.sanmarg.name
  virtual_network_name       = azurerm_virtual_network.vnet_a.name
  remote_virtual_network_id  = azurerm_virtual_network.vnet_b.id
  allow_forwarded_traffic    = true
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "peer_b_to_a" {
  name                      = "dev-vnet-b-to-vnet-a"
  resource_group_name        = azurerm_resource_group.sanmarg.name
  virtual_network_name       = azurerm_virtual_network.vnet_b.name
  remote_virtual_network_id  = azurerm_virtual_network.vnet_a.id
  allow_forwarded_traffic    = true
  allow_virtual_network_access = true
}
