# #######################################################
# # blupay deployment and service                       #
# #######################################################
#
# resource "kubernetes_deployment_v1" "blupay_voda" {
#   metadata {
#     name      = "blupay-voda"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope
#       env   = var.label_env
#     }
#   }
#   spec {
#     selector {
#       match_labels = {
#         app = "blupay-voda"
#       }
#     }
#     replicas = 1
#     template {
#       metadata {
#         labels = {
#           app = "blupay-voda"
#         }
#       }
#       spec {
#         image_pull_secrets {
#           name = var.image_pull_secret
#         }
#         container {
#           name = "blupay-voda"
#           image = "eganowdevops/telecash-blupay-dotnet-rest-api:latest"
#           image_pull_policy = "Always"
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }
# resource "kubernetes_service_v1" "blupay_svc" {
#   metadata {
#     name = "blupay-voda-svc"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope
#       env = var.label_env
#     }
#   }
#   spec {
#     port {
#       name = "https"
#       port = 443
#       target_port = "https"
#     }
#     selector = {
#       app = "blupay-voda"
#     }
#   }
# }
#
#
# #######################################################
# # egapay deployment and service                       #
# #######################################################
# resource "kubernetes_deployment_v1" "egapay_voda" {
#   metadata {
#     name      = "egapay-voda"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope
#       env   = var.label_env
#     }
#   }
#   spec {
#     selector {
#       match_labels = {
#         app = "egapay-voda"
#       }
#     }
#     replicas = 1
#     template {
#       metadata {
#         labels = {
#           app = "egapay-voda"
#         }
#       }
#       spec {
#         image_pull_secrets {
#           name = var.image_pull_secret
#         }
#         container {
#           name = "egapay-voda"
#           image = "eganowdevops/telecash-egapay-dotnet-rest-api:latest"
#           image_pull_policy = "Always"
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }
# resource "kubernetes_service_v1" "egapay_svc" {
#   metadata {
#     name = "egapay-voda-svc"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope
#       environment = var.label_env
#     }
#   }
#   spec {
#     port {
#       name = "https"
#       port = 443
#       target_port = "https"
#     }
#     selector = {
#       app = "egapay-voda"
#     }
#   }
# }
#
#
# #######################################################
# # pospay deployment and service                       #
# #######################################################
# resource "kubernetes_deployment_v1" "pospay_voda" {
#   metadata {
#     name      = "pospay-voda"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope
#       env   = var.label_env
#     }
#   }
#   spec {
#     selector {
#       match_labels = {
#         app = "pospay-voda"
#       }
#     }
#     replicas = 1
#     template {
#       metadata {
#         labels = {
#           app = "pospay-voda"
#         }
#       }
#       spec {
#         image_pull_secrets {
#           name = var.image_pull_secret
#         }
#         container {
#           name = "pospay-voda"
#           image = "ganowdevops/telecash-pospay-dotnet-rest-api:latest"
#           image_pull_policy = "Always"
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }
# resource "kubernetes_service_v1" "pospay_svc" {
#   metadata {
#     name = "pospay-voda-svc"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope
#       environment = var.label_env
#     }
#   }
#   spec {
#     port {
#       name = "https"
#       port = 443
#       target_port = "https"
#     }
#     selector = {
#       app = "pospay-voda"
#     }
#   }
# }
#
