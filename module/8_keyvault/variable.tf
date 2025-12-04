  variable "db_username" {
  type        = string
  description = "Database Username"
  }

  variable "key_vaults" {
    type = map(any)
  }