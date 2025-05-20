terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-backend"
  location = "Spain Central"
}

resource "azurerm_storage_account" "sa" {
  name                     = "kiatechtutorialbackend"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "BlobStorage"
  tags = {
    environment = "development"
  }
}