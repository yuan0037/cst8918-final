output "resource_group_name" {
  description = "resource group name"
  value       = azurerm_resource_group.rg.name
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

output "kube_config_test" {
  description = "Kubernetes config to connect to the cluster"
  value       = azurerm_kubernetes_cluster.test_cluster.kube_config_raw
  sensitive   = true
}

output "kube_config_prod" {
  description = "Kubernetes config to connect to the prod cluster"
  value       = azurerm_kubernetes_cluster.prod_cluster.kube_config_raw
  sensitive   = true
}