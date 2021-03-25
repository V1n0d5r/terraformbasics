terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

  backend "azurerm" {
    resource_group_name   = "terraformstate"
    storage_account_name  = "terraformstatenew"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
    }



# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}   

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "terraformbasics"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "terraformtestnetwork"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.2.0/24"]
}