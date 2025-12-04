data "azurerm_mssql_server" "dataserver" {
  for_each = var.sqldb1map
    name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}
