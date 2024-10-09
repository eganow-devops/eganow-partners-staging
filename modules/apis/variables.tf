#####################################
#CLUSTER                            #
#####################################
variable "k8s_kubeconfig" {
  description = " The kubeconfig file from the cluster"
  type        = string
}
variable "cluster_issuer_email" {
  description = "The email of the cluster issuer"
  type        = string
}

variable "cluster_issuer_name" {
  description = "The namespace for ingresses"
  default = "letsencrypt-dns01-digitalocean"
}

variable "cluster_issuer_private_key_secret_name" {
  description = "The name of the secret that contains the private key of the cluster issuer"
  type        = string
  default     = "cert-manager-private-key"
}

#####################################
#SECRETS                            #
#####################################

variable "onepassword_token" {
  description = "The token for vault connection"
  type = string
  sensitive   = true
}

variable "project_namespace" {
  type        = string
  description = "project default namespace"
  default     = "eganow-partners-ns"
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

variable "onepassword_credentials_json" {
  description = "The name of the secret that contains the 1password credentials"
  type = object({
    verifier = object({
      salt      = string
      localHash = string
    })
    encCredentials = object({
      kid  = string
      enc  = string
      cty  = string
      iv   = string
      data = string
    })
    version    = string
    deviceUuid = string
    uniqueKey = object({
      alg = string
      ext = bool
      k   = string
      key_ops = list(string)
      kty = string
      kid = string
    })
  })
}

variable "ingress_tls_secret_name" {
  description = "The name of the ingress tls secret"
  default     = "ingress-eganow-http-tls"
}
variable "image_pull_secret" {
  description = "The image pull secret"
  default = "dockerconfigjson"
}


variable "label_scope" {
  description = "The scope of the deployment"
  default     = "delivery"
}

variable "label_env" {
  description = "The environment of the resource"
  default     = "staging"
}

variable "domain_name" {
  description = "The domain name for the project"
  type = string
}

variable "ingress_namespace" {
  description = "The namespace for ingresses"
  default     = "ns-partners-ingress"
}

variable "insecure_port" {
  description = "The port for insecure service"
  type        = number
  default     = 8080
}

variable "secure_port_name" {
  description = "The port for secure service"
  type        = string
  default     = "https"
}
variable "cloudflare_account_id" {
  description = "The ID for the cloudflare account"
  type        = string
}
variable "cloudflare_zone_id" {
  description = "The ID for the cloudflare zone"
  type        = string
}
variable "cloudflare_api_key" {
  description = "The API key for cloudflare account"
  type        = string
}
variable "cloudflare_global_api_key" {
  description = "The API key for cloudflare account"
  type        = string
}
variable "cloudflare_project_name" {
  description = "The name of the cloudflare project"
  type        = string
}
variable "do_token" {
  description = "Digital ocean token"
  type = string
  sensitive = true
}
variable "min_pod_replicas" {
  description = "The minimum number of replicas for the deployment"
  type        = number
  default     = 1
}

variable "max_pod_replicas" {
  description = "The maximum number of replicas for the deployment"
  type        = number
  default     = 3
}
variable "cloudflare_dns_ttl" {
  description = "The TTL of the zone to facilitate DNS records."
  type        = number
  default     = 3600
}