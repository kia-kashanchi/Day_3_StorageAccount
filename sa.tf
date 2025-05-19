resource "azurerm_resource_group" "rg" {
  name     = "tf-backend"
  location = "Spain Central"
}

resource "azurerm_storage_account" "sa" {
  name                     = "kiatechtutorial-day3-tfbackend"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind = "BlobStorage"
  tags = {
    environment = "development"
  }
}