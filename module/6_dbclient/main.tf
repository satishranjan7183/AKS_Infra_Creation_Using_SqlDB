
resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sqldb1map
  name                = each.key
  #resource_group_name = each.value.resource_group_name
  # location            = each.value.location
  server_id         = data.azurerm_mssql_server.dataserver[each.key].id
  # sku_name            = each.value.sku_name
}

