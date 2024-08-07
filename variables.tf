variable "vultr_api_key" {
  description = "The token for vultr cluster"
  sensitive   = true
}

variable "do_token" {
  description = "The token for digitalocean account"
  sensitive   = true
}

variable "cluster_issuer_email" {
  description = "The email of the cluster issuer"
  type        = string
}