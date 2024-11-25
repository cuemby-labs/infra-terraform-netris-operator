#
# Netris Operator Resources
#

resource "kubernetes_namespace" "netris_operator" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "netris_operator" {
  name       = "netris-operator"
  repository = "https://netrisai.github.io/charts"
  chart      = "netris-operator"
  version    = var.chart_version
  namespace  = var.namespace_name

  set {
    name  = "controller.host"
    value = var.controller_host
  }

  set {
    name  = "controller.login"
    value = var.controller_login
  }

  set {
    name  = "controller.password"
    value = var.controller_password
  }
}

#
# Walrus Information
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}