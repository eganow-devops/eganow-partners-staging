variable "k8s_ca_certificate" {
  description = " The ca certificate from the cluster"
  type        = string
}

variable "k8s_id" {
  description = "The id from the cluster"
  type        = string
}

variable "k8s_client_key" {
  type = string
}

variable "k8s_client_cert" {
  type = string
}

variable "k8s_host" {
  description = "The host from the k8s cluster"
  type        = string
}
variable "cluster_issuer_email" {
  description = "The email of the cluster issuer"
  type        = string
}

variable "cluster_issuer_name" {
  description = "The name of the cluster issuer"
  type        = string
  default     = "eganow-cert-manager"
}

variable "cluster_issuer_private_key_secret_name" {
  description = "The name of the secret that contains the private key of the cluster issuer"
  type        = string
  default     = "cert-manager-private-key"
}

variable "do_token" {
  description = "The token for digitalocean account"
  sensitive   = true
}

variable "project_namespace" {
  type        = string
  description = "project default namespace"
  default     = "ns-eganow-staging"
}
variable "dockerconfigjson" {
  type = object({
    auths = map(object({
      username = string
      password = string
      email    = string
      auth     = string
    }))
  })
  description = "Docker config JSON"
  sensitive   = true
}