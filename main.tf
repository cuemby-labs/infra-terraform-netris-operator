resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace_name
  }
  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "helm_release" "this" {
  name       = "netris-operator"
  repository = "https://netrisai.github.io/charts"
  chart      = "netris-operator"
  version    = var.chart_version
  namespace  = kubernetes_namespace.netris_operator.metadata[0].name

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

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}