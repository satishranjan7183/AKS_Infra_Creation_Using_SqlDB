resource "random_password" "apass" {
  for_each         = var.sqlserver1map
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "azurerm_key_vault_secret" "password" {
  for_each     = var.sqlserver1map
  name         = each.value.keyvaultsecretname
  value        = random_password.apass[each.key].result
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

resource "azurerm_mssql_server" "sqlserver1" {
  for_each                     = var.sqlserver1map
  name                         = each.key
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  # administrator_login          = data.azurerm_key_vault_secret.sql_username[each.key].value
  # administrator_login_password = data.azurerm_key_vault_secret.sql_password[each.key].value
   administrator_login          = each.value.administrator_login
   administrator_login_password = azurerm_key_vault_secret.password[each.key].value
  #  administrator_login_password = each.value.administrator_login_password 
}
