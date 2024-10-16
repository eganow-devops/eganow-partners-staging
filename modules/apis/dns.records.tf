
resource "cloudflare_record" "onepassword_vault" {
  zone_id = var.cloudflare_zone_id
  name   = "vault.partners"
  type   = "A"
  content = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
  ttl = var.cloudflare_dns_ttl
  proxied = false
}
resource "cloudflare_record" "mtngh_mad_api_egapay" {
  zone_id = var.cloudflare_zone_id
  name   = "mtnghegapay.partners"
  type   = "A"
  content  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
  ttl = var.cloudflare_dns_ttl
  proxied = false
}
resource "cloudflare_record" "mtngh_mad_api_pospay" {
  zone_id = var.cloudflare_zone_id
  name   = "mtnghpospay.partners"
  type   = "A"
  content  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
  ttl = var.cloudflare_dns_ttl
  proxied = false
}

# resource "cloudflare_record" "ghipss_api_name_enquiry" {
#   zone_id = var.cloudflare_zone_id
#   name   = "ghipss.partners"
#   type   = "A"
#   content  = "172.208.35.26"
#   proxied = false
# }

# resource "digitalocean_record" "pospay_record" {
#   zone_id = var.cloudflare_zone_id
#   name   = "voda-pospay"
#   type   = "A"
#   content  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer
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
# resource "digitalocean_record" "atgh_egapay_record" {
#   domain = digitalocean_domain.partners.name
#   name   = "atgh-egapay"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer
# }
