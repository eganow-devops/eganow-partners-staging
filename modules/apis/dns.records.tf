# resource "digitalocean_domain" "partners" {
#   name       = var.domain_name
# }
#
# resource "digitalocean_record" "egapay_mtn" {
#   domain = digitalocean_domain.partners.name
#   name   = "mtngh-egapay"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
# }
# resource "digitalocean_record" "eganow_merchant" {
#   domain = digitalocean_domain.partners.name
#   name   = "merchant"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
# }
#
# resource "digitalocean_record" "onepassword_vault" {
#   domain = digitalocean_domain.partners.name
#   name   = "vault"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
# }
# resource "digitalocean_record" "atgh_egapay_record" {
#   domain = digitalocean_domain.partners.name
#   name   = "atgh-egapay"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer
# }

# resource "digitalocean_record" "ghipss_egapay_record" {
#   domain = digitalocean_domain.partners.name
#   name   = "ghipss-egapay"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer
# }

# resource "digitalocean_record" "pospay_record" {
#   domain = digitalocean_domain.partners.name
#   name   = "voda-pospay"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer
# }
#
# resource "digitalocean_record" "blupay_record" {
#   domain = digitalocean_domain.partners.name
#   name   = "voda-blupay"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer
# }
#
# resource "digitalocean_record" "voda_egapay_record" {
#   domain = digitalocean_domain.partners.id
#   type   = "A"
#   name   = "voda-egapay"
#   value = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
# }
