resource "azurerm_kubernetes_cluster" "test_cluster" {
  name                = "8918-test-cluster-group06"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "8919-group6-test-cluster"

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.6.0.0/24" // Specify the Service CIDR range
    dns_service_ip = "10.6.0.10"   // IP address within the service_cidr range
  }

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.test_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.21.2"
}

resource "azurerm_kubernetes_cluster" "prod_cluster" {
  name                = "8918-prod-cluster-group06"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "8919-group6-prod-cluster"

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.5.0.0/24" // Specify the Service CIDR range
    dns_service_ip = "10.5.0.10"   // IP address within the service_cidr range
  }

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"
    vnet_subnet_id      = azurerm_subnet.prod_subnet.id
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.21.2"
}