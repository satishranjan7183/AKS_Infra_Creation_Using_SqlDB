

# --- RESOURCE BLOCK ---
resource "azurerm_role_assignment" "acr_pull_permission" {
  for_each = var.acrpull1map  
  # 1. Assign the role to the ACR scope (The resource we're giving access TO)
  scope                = data.azurerm_container_registry.acr[each.key].id
  
  # 2. Grant the specific permission (AcrPull)
  role_definition_name = "AcrPull" 
  
  # 3. Apply the role to the AKS Kubelet Identity (The resource that needs access)
  principal_id         = data.azurerm_kubernetes_cluster.aks_cluster[each.key].kubelet_identity[0].object_id
  
  # Optional: Prevents recreation if the underlying Principal ID changes
  skip_service_principal_aad_check = true 
}

