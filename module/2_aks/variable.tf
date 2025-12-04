variable "aks_clusters" {
  description = "A map of AKS cluster configurations."
  type = map(object({
    aks_name       = string
    location       = string
    rg_name        = string
    dns_prefix     = string
    node_count     = number
    vm_size        = string
    tags           = map(string)
  }))
  default = {}
  
}