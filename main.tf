terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.72.0"
    }
  }
}

provider "azurerm" {
  tenant_id = "626b71f7-584d-4ef2-a2bb-9c323b48"
  client_id = "b0452559-ae0d-4abe-9032-76880eec805f"
  client_secret = "B9H8Q~Xiw5~zcN9dQSI31VZ_WXG5a5V"
  subscription_id = "5d64c3e3-bb53-43a1-81adf2e7af7bbe"
  features {
  }
}
locals {
  resource_group_name="sample-test"
  location="West Europe"
  storageaccount="rgstorageaccout"
}
resource "azurerm_resource_group" "app_grp" {
    name=local.resource_group_name
    location = local.location
  
}
resource "azurerm_storage_account" "example" {
  name                     = "${local.storageaccount}tfstate"
  resource_group_name      = azurerm_resource_group.app_grp.name
  location                 = azurerm_resource_group.app_grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "example" {
  name                  = "containersample"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "blob"
}
resource "azurerm_storage_blob" "example" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source = "main.tf"
}