#
# Contextual output
#

output "walrus_project_name" {
  value       = try(local.context["project"]["name"], null)
  description = "The name of project where deployed in Walrus."
}

output "walrus_project_id" {
  value       = try(local.context["project"]["id"], null)
  description = "The id of project where deployed in Walrus."
}

output "walrus_environment_name" {
  value       = try(local.context["environment"]["name"], null)
  description = "The name of environment where deployed in Walrus."
}

output "walrus_environment_id" {
  value       = try(local.context["environment"]["id"], null)
  description = "The id of environment where deployed in Walrus."
}

output "walrus_resource_name" {
  value       = try(local.context["resource"]["name"], null)
  description = "The name of resource where deployed in Walrus."
}

output "walrus_resource_id" {
  value       = try(local.context["resource"]["id"], null)
  description = "The id of resource where deployed in Walrus."
}

#
# Submodule output
#

output "submodule" {
  value       = module.submodule.message
  description = "The message from submodule."
}

#
# module output
#

output "namespace" {
  description = "The Kubernetes namespace where the Netris operator is installed."
  value       = kubernetes_namespace.netris_operator.metadata[0].name
}

output "helm_release_status" {
  description = "The status of the Helm release."
  value       = helm_release.netris_operator.status
}