provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags = {
    Environment = "Terraform on Azure"
  }
}

resource "azurerm_app_service_plan" "serviceplan" {
  name                = var.serviceplan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = var.appservice_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.serviceplan.id
  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2"
    "ApiUrl"                       = ""
    "ApiUrlShoppingCart"           = ""
    "MongoConnectionString"        = ""
    "SqlConnectionString"          = ""
    "productImagesUrl"             = "	https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail"
    "Personalizer__ApiKey"         = ""
    "Personalizer__Endpoint"       = ""
  }
}