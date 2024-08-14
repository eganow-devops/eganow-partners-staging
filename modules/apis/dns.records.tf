resource "digitalocean_domain" "partners" {
  name       = var.partners_domain_name
}

# resource "digitalocean_record" "eganow_partners" {
#   domain = digitalocean_domain.partners.id
#   type   = "A"
#   name   = "partners"
#   value  = #Bilson to explain this reference>>>>>>>>>>>>>>>>>>>
#   # data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
# }