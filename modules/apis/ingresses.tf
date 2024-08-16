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
    name      = "ingress-eganow-http"
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

    rule {
      host = "${digitalocean_record.egapay_mtn.name}.${var.partners_domain_name}"
      http {
        path {
          path      = "/api/v1"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.egapay_svc.metadata.0.name
              port {
                name = kubernetes_service_v1.egapay_svc.spec.0.port.0.name
              }
            }
          }
        }
      }
    }
  }
}

#     rule {
#       host = "${digitalocean_record.onepassword_vault.name}.${var.partners_domain_name}"
#       http {
#         path {
#           path      = "/api/v1"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = data.kubernetes_service_v1.onepassword.metadata.0.name
#               port {
#                 name = var.insecure_port
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }

#update this after service for deployment is created
#     rule {
#       host = "${digitalocean_record.eganow_merchant.name}.${var.partners_domain_name}"
#       http {
#         path {
#           path      = "api/v1"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = data.kubernetes_service_v1
#               port {
#                 name = ""
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }

################################
# gRPC INGRESS                 #
################################
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




#
#     rule {
#       host = "eganowmtngh.com"
#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "egapay-mtn-openapi-svc"
#               port {
#                 name = "grpc"
#               }
#             }
#           }
#         }
#       }
#     }
#
#     rule {
#       host = "ghipss-egapay.dev.egadevapi.com"
#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "egapay-ghipss-svc"
#               port {
#                 name = "grpc"
#               }
#             }
#           }
#         }
#       }
#     }
#
#     rule {
#       host = "eganowcoredev.dev.egadevapi.com"
#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "egacore-api-for-developer-api-svc"
#               port {
#                 name = "grpc"
#               }
#             }
#           }
#         }
#       }
#     }
#
#     rule {
#       host = "eganowcoredev.dev.egadevapi.com"
#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "egacore-api-for-developer-api-svc"
#               port {
#                 name = "grpc"
#               }
#             }
#           }
#         }
#       }
#     }
#
#     rule {
#       host = "atgh-egapay.dev.egadevapi.com"
#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "egapay-atmoney-svc"
#               port {
#                 name = "grpc"
#               }
#             }
#           }
#         }
#       }
#     }
#
#     rule {
#       host = "merchant.dev.egadevapi.com"
#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "eganow-merchant-svc"
#               port {
#                 name = "grpc"
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }