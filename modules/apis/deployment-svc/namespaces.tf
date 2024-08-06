# terraform {
#   required_providers {
#     kubernetes = {
#       source = "hashicorp/kubernetes"
#     }
#     linode = {
#       source = "linode/linode"
#     }
#   }
# }
#
# # create project namespace
# resource "kubernetes_namespace_v1" "egapartnersdevops" {
#   metadata {
#     name = "egapartnersdevops"
#   }
# }
resource "kubernetes_namespace_v1" "pay_partners_namespace" {
  metadata {
    name = var.project_namespace
  }
}
