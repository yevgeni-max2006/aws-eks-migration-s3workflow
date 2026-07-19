
###  ---  Default Application  ---  ###
module "httpd" {
  source = "./modules/httpd"
  depends_on = [kubernetes_namespace.migration]

  name   = "httpd-server"
  namespace = "default"
  replicas  = 1
  image = "virtapp/apache:7f6c4bf4-3-6"
  service_port = 8080
  service_type = "ClusterIP"
}

module "minio" {
  source = "./modules/minio"
  depends_on = [module.httpd]
}

module "velero" {
  source = "./modules/velero"
  depends_on = [module.minio]
}

module "velero-ui" {
  source = "./modules/velero-ui"
  depends_on = [module.velero]
}

module "ingress" {
  source = "./modules/ingress"
  depends_on = [module.velero-ui]
}
