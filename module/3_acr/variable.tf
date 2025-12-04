variable "acrs" {
  description = "A map of Azure Container Registry configurations."
  type = map(object({
    acr_name = string
    rg_name  = string
    location = string
    sku      = string
  }))
}