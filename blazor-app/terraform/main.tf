provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "blazor-rg"
  location = "East US"
}

resource "azurerm_static_site" "blazor_app" {
  name                = "blazor-wasm-site-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name = "Free"

  index_document = "index.html"
  error_404_document = "index.html"
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}
