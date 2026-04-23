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


resource "azurerm_resource_group" "daksh1" {
  name     = "rg_daksh5"
  location = "West Europe"
}

resource "azurerm_storage_account" "deep_storage1" {
  name                     = "storagedeepak101"
  resource_group_name      = azurerm_resource_group.daksh1.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

}

resource "azurerm_storage_account" "deep_storage2" {
  name                     = "storagedeepak111"
  resource_group_name      = azurerm_resource_group.daksh1.name
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account" "deep_storage3" {
  name                     = "storagedeepak121"
  resource_group_name      = "rg_daksh5"
  location                 = azurerm_resource_group.daksh1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_account" "deepu_storage4" {
  depends_on = [ azurerm_resource_group.daksh1]
  name                     = "storagedeepak131"
  resource_group_name      = "rg_daksh5"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_account" "deepu_storage5" {
  name                     = "storagedeepak141"
  resource_group_name      = "rg_daksh5"
  location                 = azurerm_storage_account.deep_storage1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_resource_group" "rg" {
    name = "rg-infra-pipeline-dev1"
    location = "east us"
}

