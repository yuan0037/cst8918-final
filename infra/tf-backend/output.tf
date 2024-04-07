output "resource_group_name" {
  description = "resource group name"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "storage account for state file"
  value       = azurerm_storage_account.backendstate.name
}

output "container_name" {
  description = "container name for state file"
  value       = azurerm_storage_container.backendstate.name
}


output "primary_access_key" {
  description = "primary access key for storage account"
  value       = azurerm_storage_account.backendstate.primary_access_key
  sensitive   = true
}

output "acr_login_server" {
  description = "Login server for Azure Container Registry"
  value       = azurerm_container_registry.cr.login_server
}

output "acr_username" {
  description = "Username for Azure Container Registry"
  value       = azurerm_container_registry.cr.admin_username
}

output "acr_password" {
  description = "Password for Azure Container Registry"
  value       = azurerm_container_registry.cr.admin_password
  sensitive   = true
}