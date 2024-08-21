data "kubernetes_service_v1" "ingress_lb" {
  metadata {
    name      = "${helm_release.nginx_ingress.name}-${helm_release.nginx_ingress.chart}-controller"
    namespace = var.ingress_namespace
  }
}

data "kubernetes_service_v1" "onepassword" {
  metadata {
    name      = helm_release.onepassword.name
    namespace = var.project_namespace
  }
}

##############################################
# SERVICE: MTNGH MAD-API NAME ENQUIRY        #
##############################################
resource "kubernetes_service_v1" "mtn_gh_mad_api_name_enquiry" {
  metadata {
    name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.metadata.0.name}-svc"
    namespace = var.project_namespace
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.metadata.0.name
    }
    port {
      name        = "http"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
    }
    port {
      name        = "grpc"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
    }
  }
}