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
########################################
# SERVICE: MTNGH MAD API NAME ENQUIRY
########################################
# resource "kubernetes_service_v1" "mtn_gh_mad_api_name_enquiry" {
#   metadata {
#     name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.metadata.0.name}-svc"
#     namespace = var.project_namespace
#   }
#
#   spec {
#     selector = {
#       app = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.selector.0.match_labels.app
#     }
#
#     port {
#       name        = "http"
#       port        = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
#       target_port = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
#     }
#
#     port {
#       name        = "grpc"
#       port        = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.1.container_port
#       target_port = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.1.container_port
#     }
#   }
# }

resource "kubernetes_service_v1" "mtn_gh_mad_api_egapay" {
  metadata {
    name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_egapay.metadata.0.name}-svc"
    namespace = var.project_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "http"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.0.container_port
    }

    port {
      name        = "grpc"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.1.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.1.container_port
    }
  }
}

resource "kubernetes_service_v1" "mtn_gh_mad_api_pospay" {
  metadata {
    name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_pospay.metadata.0.name}-svc"
    namespace = var.project_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "http"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.0.container_port
    }

    port {
      name        = "grpc"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.1.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.1.container_port
    }
  }
}