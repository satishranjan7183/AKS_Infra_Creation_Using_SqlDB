# --- DATA SOURCE BLOCK ---
data "azurerm_kubernetes_cluster" "aks_cluster" {
 for_each = var.acrpull1map 
  name                = each.value.aks_cluster_name
  resource_group_name = each.value.aks_resource_group
}

data "azurerm_container_registry" "acr" {
    for_each = var.acrpull1map 
  name                = each.value.acr_name
  resource_group_name = each.value.acr_resource_group
}