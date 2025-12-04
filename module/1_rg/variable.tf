variable "rgs" {
  description = "A map of resource group configurations."
  type = map(object({
    location = string
  }))
}
