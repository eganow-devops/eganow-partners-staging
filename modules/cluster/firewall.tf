# resource "vultr_firewall_group" "cluster_firewall_group" {
#   description = "The group for firewall rules"
#
#   }
#
# #############################################
# #Subnet1 inbound rules                      #
# #############################################
# resource "vultr_firewall_rule" "allow_ssh_subnet1" {
#     firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#     protocol          = "tcp"
#     ip_type           = var.firewall_ip_type
#     subnet            = var.ega_subnet_1
#     subnet_size       = var.ega_subnet_size
#     port              = var.firewall_ssh_port
#     notes             = "Rule allows ssh into cluster"
#   }
#
# resource "vultr_firewall_rule" "allow_http_subnet1" {
#     firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#     protocol          = "tcp"
#     ip_type           = var.firewall_ip_type
#     subnet            = var.ega_subnet_1
#     subnet_size       = var.ega_subnet_size
#     port              = var.firewall_http_port
#     notes             = "Rule allows http into cluster"
#   }
#
#
# #############################################
# #Subnet2 inbound rules                      #
# #############################################
# resource "vultr_firewall_rule" "allow_ssh_subnet2" {
#     firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#     protocol          = "tcp"
#     ip_type           = var.firewall_ip_type
#     subnet            = var.ega_subnet_2
#     subnet_size       = var.ega_subnet_size
#     port              = var.firewall_ssh_port
#     notes             = "Rule allows ssh into cluster"
#   }
#
# resource "vultr_firewall_rule" "allow_http_subnet2" {
#     firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#     protocol          = "tcp"
#     ip_type           = var.firewall_ip_type
#     subnet            = var.ega_subnet_2
#     subnet_size       = var.ega_subnet_size
#     port              = var.firewall_http_port
#     notes             = "Rule allows http into cluster"
#   }
#
#
# #############################################
# #Subnet1 outbound rules                      #
# #############################################
# resource "vultr_firewall_rule" "allow_smtp_subnet1" {
#     firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#     protocol          = "tcp"
#     ip_type           = var.firewall_ip_type
#     subnet            = var.ega_subnet_1
#     subnet_size       = var.ega_subnet_size
#     port              = var.firewall_smtp_port
#     notes             = "Rule allows smtp out of the cluster"
#   }
# resource "vultr_firewall_rule" "allow_smtps_subnet1" {
#   firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#   protocol          = "tcp"
#   ip_type           = var.firewall_ip_type
#   subnet            = var.ega_subnet_1
#   subnet_size       = var.ega_subnet_size
#   port              = var.firewall_smtps_port
#   notes             = "Rule allows smtps out of the cluster"
# }
#
#
# #############################################
# #Subnet2 outbound rules                     #
# #############################################
# resource "vultr_firewall_rule" "allow_smtp_subnet2" {
#     firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#     protocol          = "tcp"
#     ip_type           = var.firewall_ip_type
#     subnet            = var.ega_subnet_2
#     subnet_size       = var.ega_subnet_size
#     port              = var.firewall_smtp_port
#     notes             = "Rule allows smtp out of the cluster"
#   }
# resource "vultr_firewall_rule" "allow_smtps_subnet2" {
#   firewall_group_id = vultr_firewall_group.cluster_firewall_group.id
#   protocol          = "tcp"
#   ip_type           = var.firewall_ip_type
#   subnet            = var.ega_subnet_2
#   subnet_size       = var.ega_subnet_size
#   port              = var.firewall_smtps_port
#   notes             = "Rule allows smtps out of the cluster"
# }