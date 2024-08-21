
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
#     selector = {
#       app = ""
#     }
#   }
# }
