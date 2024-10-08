#####################################
#CLUSTER                            #
#####################################

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

variable "do_token" {
  description = "The token for digitalocean account"
  sensitive   = true
}

variable "onepassword_token" {
  description = "The token for vault connection"
  type = string
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

variable "partners_domain_name" {
  description = "The domain name for the project"
  default     = "dev.egadevapi.com"
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

variable "max_pod_replicas" {
  description = "The maximum number of pods for autoscaling"
  type        = number
  default = 3

}

variable "min_pod_replicas" {
  description = "The minimum number of pods for autoscaling"
  type        = number
  default = 1
}
