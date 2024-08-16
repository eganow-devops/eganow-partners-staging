data "kubernetes_service_v1" "ingress_lb" {
  metadata {
    name      = "${helm_release.nginx_ingress.name}-${helm_release.nginx_ingress.chart}-controller"
    namespace = var.ingress_namespace
  }
}

# data "kubernetes_service_v1" "onepassword" {
#   metadata {
#     name      = helm_release.onepassword.name
#     namespace = var.project_namespace
#   }
# }



