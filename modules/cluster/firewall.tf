# resource "linode_firewall" "cluster_firewall" {
#   label = "cluster_firewall"
#
#   inbound {
#     label    = "allow-http"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = [var.eganow_ip_1]
#   }
#   inbound {
#     label    = "allow-http"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = [var.eganow_ip_2]
#   }
#   inbound {
#     label    = "allow-https"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "443"
#     ipv4     = [var.eganow_ip_1]
#   }
#
#   inbound {
#     label    = "allow-https"
#     action   = "ACCEPT"
#     protocol = "TCP"
#     ports    = "443"
#     ipv4     = [var.eganow_ip_2]
#   }
#
#   inbound_policy = "DROP"
#
#   outbound {
#     label    = "allow-http"
#     action   = "DROP"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = [var.eganow_ip_1]
#   }
#   outbound {
#     label    = "allow-http"
#     action   = "DROP"
#     protocol = "TCP"
#     ports    = "80"
#     ipv4     = [var.eganow_ip_1]
#   }
#
#   outbound {
#     label    = "allow-https"
#     action   = "DROP"
#     protocol = "TCP"
#     ports    = "443"
#     ipv4     = [var.eganow_ip_2]
#   }
#   outbound {
#     label    = "allow-https"
#     action   = "DROP"
#     protocol = "TCP"
#     ports    = "443"
#     ipv4     = [var.eganow_ip_2]
#   }
#
#   outbound_policy = "DROP"
# }