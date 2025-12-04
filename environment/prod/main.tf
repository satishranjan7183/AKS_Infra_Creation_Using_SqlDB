module "rg" {
  source = "../../module/1_rg"
  rgs    = var.dev_rgs
}

module "aks" {
  source       = "../../module/2_aks"
  aks_clusters = var.dev_aks_clusters
  depends_on = [ module.rg ]
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../module/3_acr"
  acrs       = var.dev_acrs
}

module "acrpull" {
  depends_on  = [module.aks, module.acr]
  source = "../../module/4_acrpullpermission"
  acrpull1map = var.acrpull1mapmodule
  
}

module "dbserver" {
  depends_on  = [module.rg, module.keyvault]
  source      = "../../module/5_dbserver"
  sqlserver1map = var.dbsqlserver1mapmodule
}

module "dbclient" {
  depends_on  = [module.rg]
  source      = "../../module/6_dbclient"
  sqldb1map = var.dbsqldb1mapmodule
}

module "dbfirewall" {
  depends_on  = [module.rg]
  source      = "../../module/7_dbfirewall"
  dbfirewall1map = var.dbfirewall1mapmodule
}

module "keyvault" {
  depends_on  = [module.rg]
  source      = "../../module/8_keyvault"
  key_vaults = var.keyvault1mapmodule
  db_username = var.db_username
}