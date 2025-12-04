dev_rgs = {
  "dev-todo-rg-centralcanada" = {
    location = "central india"
  }
}

dev_acrs = {
  "acr1" = {
    acr_name = "devtodoacrcentralcanada"
    rg_name  = "dev-todo-rg-centralcanada"
    location = "central india"
    sku      = "Standard"
  }
}

dev_aks_clusters = {
  "dev-todo-aks-centralcanada" = {
    aks_name   = "dev-todo-aks-centralcanada"
    location   = "central india"
    rg_name    = "dev-todo-rg-centralcanada"
    dns_prefix = "devtodoaks"
    node_count = 1
    vm_size    = "Standard_D2s_v5"
    tags = {
      "Environment"    = "dev"
      "CostCenter"     = "TPZ432001"
      "Owner"          = "Randhir Kumar"
      "Application"    = "ToDoApp"
      "Region"         = "central india"
      "Project"        = "ToDoApp"
      "Lifecycle"      = "Prototype"
      "CostCenterCode" = "TPZ432001"
    }
  }
}
acrpull1mapmodule = {
  "acrpull1" = {
    aks_cluster_name   = "dev-todo-aks-centralcanada"
    aks_resource_group = "dev-todo-rg-centralcanada"
    acr_name           = "devtodoacrcentralcanada"
    acr_resource_group = "dev-todo-rg-centralcanada"
  }
}

dbfirewall1mapmodule = {
  "dbfirewall1" = {
    sql_server_name       = "devtododbsrvwus1"
    resource_group_name   = "dev-todo-rg-centralcanada"
}
}

dbsqldb1mapmodule = {
  "devtododbsrvwus1" = {
    sql_server_name     = "devtododbsrvwus1"
    resource_group_name = "dev-todo-rg-centralcanada"
    location            = "central india"
    sku_name            = "S0"
    max_size_gb        = 10
  }
}

dbsqlserver1mapmodule = {
  "devtododbsrvwus1" = {
    resource_group_name            = "dev-todo-rg-centralcanada"
    location                       = "central india"
    version                        = "12.0"
    administrator_login            = "devopsadmin"
    administrator_login_password   = "P@ssw01rd@123"
    allow_access_to_azure_services = true
    kv_name = "devtodokeyvault"
    keyvaultsecretname = "sql-server-password"
  }
}

keyvault1mapmodule = {
  "devtodokeyvault" = {
    keyvault_name        = "devtodokeyvaultcentralcanada"
    resource_group_name  = "dev-todo-rg-centralcanada"
    location             = "central india"
    sku_name             = "standard"
    # tenant_id            = "your-tenant-id"
    rg_name              = "dev-todo-rg-centralcanada"  
  }
}

db_username = "admin123"