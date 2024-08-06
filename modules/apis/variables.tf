variable "k8s_ca_certificate" {
  description = " The ca certificate from the cluster"
  type = string
}

variable "k8s_id" {
  description = "The id from the cluster"
  type = string
}

variable "k8s_key" {
  type = string
}

variable "k8s_cert" {
  type = string
}

variable "k8s_host" {
  description = "The host from the k8s cluster"
  type = string
}
