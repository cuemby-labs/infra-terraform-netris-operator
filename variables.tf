#
# Netris Operator
#

variable "namespace_name" {
  description = "The name of the Kubernetes namespace."
  type        = string
  default     = "netris-operator"
}

variable "chart_version" {
  description = "The version of the Netris Operator Helm release chart."
  type        = string
  default     = "4.3.1"
}

variable "controller_host" {
  description = "The host URL of the Netris controller."
  type        = string
  default     = "https://"
}

variable "controller_login" {
  description = "The login user for the Netris controller."
  type        = string
  default     = "admin"
}

variable "controller_password" {
  description = "The login password for the Netris controller."
  type        = string
  sensitive   = true
  default     = ""
}

#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}