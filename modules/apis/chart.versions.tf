variable "nginx_ingress_version" {
  description = "The version of the Nginx Ingress chart"
  type = string
  default = "4.11.0"
}

variable "redis_ha_version" {
  description = "The version of Redis HA chart"
  type = string
  default = "4.27.1"
}