variable "dev_rgs" {
    type = map(any)
}
variable "dev_acrs" {
    type = map(any)
}
variable "dev_aks_clusters" {
    type = map(any)
}
variable "acrpull1mapmodule" {
    type = map(any)
}
variable "dbsqlserver1mapmodule" {
    type = map(any)
}
variable "dbsqldb1mapmodule" {
    type = map(any)
}
variable "dbfirewall1mapmodule" {
    type = map(any)
}
variable "keyvault1mapmodule" {
    type = map(any)
}

variable "db_username" {
    type = string
}