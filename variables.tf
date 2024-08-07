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