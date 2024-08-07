variable "label_scope" {
  description = "The scope of the deployment"
  default     = "delivery"
}

variable "label_env" {
  description = "The environment of the resource"
  default     = "staging"
}

variable "docker_registry" {
  description = "The name of the docker registry"
  type        = string
}
variable "project_namespace" {
  type        = string
  description = "Namespace where the secret will be created"
}