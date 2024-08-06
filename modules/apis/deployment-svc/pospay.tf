# resource "kubernetes_deployment_v1" "pospay_voda" {
#   metadata {
#     name      = "pospay-voda"
#     namespace = var.project_namespace
#     labels = {
#       scope = var.label_scope_dotnet
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
#           name = var.docker_registry
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
#       scope = var.label_scope_dotnet
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
