#################################
# CLUSTER VARIABLES             #
#################################

variable "cluster_k8s_version" {
  description = "The Kubernetes version for the cluster"
  type        = string
  default     = "1.31"
}

variable "cluster_label" {
  description = "The label for the cluster"
  type        = string
  default     = "eganow-partner-staging"
}

variable "cluster_region" {
  description = "The region for the cluster"
  type        = string
  default     = "gb-lon"
}

variable "cluster_tags" {
  description = "The tags for the cluster"
  type = list(string)
  default = ["eganow-partner-staging", "terraform:linode"]
}


variable "cluster_node_autoscale_min_count" {
  description = "The minimum count for autoscaling nodes"
  type = number
  default = "1"
}

variable "cluster_node_autoscale_max_count" {
  description = "The maximum count for autoscaling nodes"
  type = number
  default = "3"

}


variable "cluster_pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. (required)"
  type = list(object({
    type  = string
    count = number
  }))
  default = [
    {
      type  = "g6-standard-2"
      count = 3
    }
  ]
}

variable "linode_api_key" {
  type = string
}


#################################
# FIREWALL VARIABLES            #
#################################
variable "ega_subnet_1" {
  type = string
  description = "The source address for subnet1 accessing the cluster"
  default = "216.128.0.2"
}

variable "ega_subnet_2" {
  type = string
  description = "The source address for subnet2 accessing the cluster"
  default = "197.251.253.48"
}

variable "ega_subnet_size" {
  type = string
  description = "The number of ips allowed with the subnet"
  default = "32"
}

variable "firewall_ip_type" {
  type = string
  description = "The ip type for the firewall"
  default = "v4"
}

variable "firewall_ssh_port" {
  type = string
  description = "The ssh port to the cluster"
  default = "22"
}

variable "firewall_http_port" {
  type = string
  description = "The http port to the cluster"
  default = "443"
}

variable "firewall_smtp_port" {
  type = string
  description = "The smtp port to the cluster"
  default = "25"
}

variable "firewall_smtps_port" {
  type = string
  description = "The smtps port to the cluster"
  default = "587"
}