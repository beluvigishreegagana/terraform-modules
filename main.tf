resource "azurerm_service_plan" "plan" {
  name = var.azurerm_service_plan
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  os_type = "Linux"
  sku_name = "F1"
  
}
resource "azurerm_linux_web_app" "webapp" {
  name = var.azurerm_app_service
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  service_plan_id = azurerm_service_plan.plan.id
  site_config {
    always_on = "false"
    application_stack {
      java_server = "TOMCAT"
      java_server_version = "9.0"
      java_version = "8"
    }
  }
  
}
