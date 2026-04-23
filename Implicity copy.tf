terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
backend "azurerm" {
    
    resource_group_name = "rg_deepak"            
    storage_account_name = "deepakstoragepip"                             
    container_name       = "gitdemo"                              
    key = "gitdemo.tfstate"
  
}
}

provider "azurerm" {
  features {}
subscription_id = "9097d0f8-4798-48d3-891f-83da77060e96"

 }


resource "azurerm_resource_group" "daksh" {
  name     = "rg_daksh"
  location = "West Europe"
}

resource "azurerm_storage_account" "deep_storage1" {
  name                     = "storagedeepak10"
  resource_group_name      = azurerm_resource_group.daksh.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

}

resource "azurerm_storage_account" "deep_storage2" {
  name                     = "storagedeepak11"
  resource_group_name      = azurerm_resource_group.daksh.name
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account" "deep_storage3" {
  name                     = "storagedeepak12"
  resource_group_name      = "rg_daksh"
  location                 = azurerm_resource_group.daksh.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_account" "deepu_storage4" {
  depends_on = [ azurerm_resource_group.daksh]
  name                     = "storagedeepak13"
  resource_group_name      = "rg_daksh"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_account" "deepu_storage5" {
  name                     = "storagedeepak14"
  resource_group_name      = "rg_daksh"
  location                 = azurerm_storage_account.deep_storage1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_resource_group" "rg" {
    name = "rg-infra-pipeline-dev"
    location = "east us"
}

