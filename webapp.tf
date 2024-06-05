resource "azurerm_service_plan" "plan" {
  name                = var.azurerm_service_plan
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type = "Linux"
  sku_name = "P1v2"
 
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.azurerm_app_service
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  site_config {
    always_on = true
    application_stack {
          java_version        = "8"
          java_server         = "TOMCAT"  
          java_server_version = "9.0"     
        }

    
  }
  
  depends_on = [
    azurerm_service_plan.plan
  ]
}
