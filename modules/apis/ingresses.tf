resource "helm_release" "nginx_ingress" {
  chart      = "ingress-nginx"
  name       = "partners-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = var.nginx_ingress_version
  namespace  = var.ingress_namespace

  create_namespace = true
  cleanup_on_fail  = true
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

#################################
# HTTP INGRESS                  #
#################################
resource "kubernetes_ingress_v1" "ingress_eganow_http" {
  metadata {
    name      = "http-ingress"
    namespace = var.project_namespace
    labels = {
      scope       = var.label_scope
      environment = var.label_env
    }
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect"       = "true"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/ssl-passthrough"    = "true"
      "cert-manager.io/cluster-issuer"                 = var.cluster_issuer_name
      "kubernetes.io/ingress.class"                    = "nginx"
      "nginx.ingress.kubernetes.io/enable-cors"        = "true"
    }
  }
  spec {
    tls {
      hosts = ["*.${var.partners_domain_name}"]
      secret_name = var.ingress_tls_secret_name
    }

    ingress_class_name = "nginx"

#     rule {
#       host = "${digitalocean_record.egapay_mtn.name}.${var.partners_domain_name}"
#       http {
#         path {
#           path      = "/api/v1"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = var.secure_port_name
#               port {
#                 name =kubernetes_service_v1.egapay_svc.spec.0.port.0.port
#               }
#             }
#           }
#         }
#       }
#     }
    rule {
      host = "${digitalocean_record.onepassword_vault.name}.${var.partners_domain_name}"
      http {
        path {
          path      = "/v1"
          path_type = "Prefix"
          backend {
            service {
              name = data.kubernetes_service_v1.onepassword.metadata.0.name
              port {
                number = var.insecure_port
              }
            }
          }
        }
      }
    }
  }
}




###############################
#gRPC INGRESS                  #
###############################
resource "kubernetes_ingress_v1" "ingress_eganow_grpc" {
  metadata {
    name      = "ingress-eganow-grpc"
    namespace = var.project_namespace
    labels = {
      scope = var.label_scope
      env   = var.label_env
    }
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect"       = "true"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/backend-protocol"   = "GRPC"
      "cert-manager.io/cluster-issuer"                 = var.cluster_issuer_name
      "kubernetes.io/ingress.class"                    = "nginx"
    }
  }

  spec {
    tls {
      hosts = ["*.${var.partners_domain_name}"]
      secret_name = "ingress-eganow-grpc-tls"
    }
    ingress_class_name = "nginx"

    rule {
      host = "${digitalocean_record.egapay_mtn.name}.${var.partners_domain_name}"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.egapay_svc.metadata.0.name
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }
  }
}
