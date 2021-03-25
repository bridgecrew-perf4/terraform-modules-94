resource "oci_core_security_list" security_list {
    #Required
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id

    #Optional
    display_name = var.display_name

    dynamic "egress_security_rules" {
        for_each = var.egress_security_rules
        content {
            destination = egress_security_rules.value["dest"]
            protocol = local.protocols[egress_security_rules.value["protocol"]]
            description = lookup(egress_security_rules.value, "desc", "")
            stateless = lookup(egress_security_rules.value, "stateless", false)
            destination_type = lookup(egress_security_rules.value, "dest_type", "CIDR_BLOCK")

            dynamic udp_options {
                # Options for UDP with DESTINATION PORT MAX/MIN and SOURCE PORT MAX/MIN
                for_each = egress_security_rules.value["protocol"] == "UDP" && lookup(egress_security_rules.value, "dest_port", null) != null && lookup(egress_security_rules.value, "src_port", null) != null ? [1]: []

                content {
                    max = lookup(egress_security_rules.value["dest_port"], "max", null)
                    min = lookup(egress_security_rules.value["dest_port"], "min", null)

                    source_port_range {
                        max = lookup(egress_security_rules.value["src_port"], "max", null)
                        min = lookup(egress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic udp_options {
                # Options for UDP with only DESTINATION PORT MAX/MIN
                for_each = egress_security_rules.value["protocol"] == "UDP" && lookup(egress_security_rules.value, "dest_port", null) != null && lookup(egress_security_rules.value, "src_port", null) == null ? [1]: []

                content {
                    max = lookup(egress_security_rules.value["dest_port"], "max", null)
                    min = lookup(egress_security_rules.value["dest_port"], "min", null)
                }
            }

            dynamic udp_options {
                # Options for UDP with only SOURCE PORT MAX/MIN
                for_each = egress_security_rules.value["protocol"] == "UDP" && lookup(egress_security_rules.value, "dest_port", null) == null && lookup(egress_security_rules.value, "src_port", null) != null ? [1]: []

                content {
                    source_port_range {
                        max = lookup(egress_security_rules.value["src_port"], "max", null)
                        min = lookup(egress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic tcp_options {
                # Options for TCP with DESTINATION PORT MAX/MIN and SOURCE PORT MAX/MIN
                for_each = egress_security_rules.value["protocol"] == "TCP" && lookup(egress_security_rules.value, "dest_port", null) != null && lookup(egress_security_rules.value, "src_port", null) != null ? [1]: []

                content {
                    max = lookup(egress_security_rules.value["dest_port"], "max", null)
                    min = lookup(egress_security_rules.value["dest_port"], "min", null)

                    source_port_range {
                        max = lookup(egress_security_rules.value["src_port"], "max", null)
                        min = lookup(egress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic tcp_options {
                # Options for TCP with only DESTINATION PORT MAX/MIN
                for_each = egress_security_rules.value["protocol"] == "TCP" && lookup(egress_security_rules.value, "dest_port", null) != null && lookup(egress_security_rules.value, "src_port", null) == null ? [1]: []

                content {
                    max = lookup(egress_security_rules.value["dest_port"], "max", null)
                    min = lookup(egress_security_rules.value["dest_port"], "min", null)
                }
            }
            # Options for TCP with only SOURCE PORT MAX/MIN

            dynamic tcp_options {
                # Options for TCP with only SOURCE PORT MAX/MIN
                for_each = egress_security_rules.value["protocol"] == "TCP" && lookup(egress_security_rules.value, "dest_port", null) == null && lookup(egress_security_rules.value, "src_port", null) != null ? [1]: []

                content {
                    source_port_range {
                        max = lookup(egress_security_rules.value["src_port"], "max", null)
                        min = lookup(egress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic icmp_options {
                for_each = var.egress_security_rules.value["protocol"] == "ICMP" ? [1]: []

                content {
                    type = lookup(egress_security_rules.value["icmp_options"], "type", null)
                    code = lookup(egress_security_rules.value["icmp_options"], "code", null)
                }
            }
        }
    }


    dynamic "ingress_security_rules" {
        for_each = var.ingress_security_rules
        content {
            source = ingress_security_rules.value["src"]
            protocol = local.protocols[ingress_security_rules.value["protocol"]]
            description = lookup(ingress_security_rules.value, "desc", "")
            stateless = lookup(ingress_security_rules.value, "stateless", false)
            source_type = lookup(ingress_security_rules.value, "dest_type", "CIDR_BLOCK")

            dynamic tcp_options {
                # Options for TCP with only DESTINATION PORT MAX/MIN
                for_each = ingress_security_rules.value["protocol"] == "TCP" && lookup(ingress_security_rules.value, "dest_port", null) != null && lookup(ingress_security_rules.value, "src_port", null) == null ? [1]: []

                content {
                    max = lookup(ingress_security_rules.value["dest_port"], "max", null)
                    min = lookup(ingress_security_rules.value["dest_port"], "min", null)
                }
            }

            dynamic tcp_options {
                # Options for TCP with DESTINATION PORT MAX/MIN and SOURCE PORT MAX/MIN
                for_each = ingress_security_rules.value["protocol"] == "TCP" && lookup(ingress_security_rules.value, "src_port", null) != null && lookup(ingress_security_rules.value, "dest_port", null) != null ? [1]:[]

                content {
                    max = lookup(ingress_security_rules.value["dest_port"], "max", null)
                    min = lookup(ingress_security_rules.value["dest_port"], "min", null)

                    source_port_range {
                        max = lookup(ingress_security_rules.value["src_port"], "max", null)
                        min = lookup(ingress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic tcp_options {
                # Options for TCP with only SOURCE PORT MAX/MIN
                for_each = ingress_security_rules.value["protocol"] == "TCP" && lookup(ingress_security_rules.value, "src_port", null) != null && lookup(ingress_security_rules.value, "dest_port", null) == null ? [1]: []

                content {
                    source_port_range {
                        max = lookup(ingress_security_rules.value["src_port"], "max", null)
                        min = lookup(ingress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic udp_options {
                # Options for UDP with only DESTINATION PORT MAX/MIN
                for_each = ingress_security_rules.value["protocol"] == "UDP" && lookup(ingress_security_rules.value, "dest_port", null) != null && lookup(ingress_security_rules.value, "src_port", null) == null ? [1]: []

                content {
                    max = lookup(ingress_security_rules.value["dest_port"], "max", null)
                    min = lookup(ingress_security_rules.value["dest_port"], "min", null)
                }
            }

            dynamic udp_options {
                # Options for UDP with DESTINATION PORT MAX/MIN and SOURCE PORT MAX/MIN
                for_each = ingress_security_rules.value["protocol"] == "UDP" && lookup(ingress_security_rules.value, "src_port", null) != null && lookup(ingress_security_rules.value, "dest_port", null) != null ? [1]:[]


                content {
                    max = lookup(ingress_security_rules.value["dest_port"], "max", null)
                    min = lookup(ingress_security_rules.value["dest_port"], "min", null)

                    source_port_range {
                        max = lookup(ingress_security_rules.value["src_port"], "max", null)
                        min = lookup(ingress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic udp_options {
                # Options for UDP with only SOURCE PORT MAX/MIN
                for_each = lookup(ingress_security_rules.value, "protocol", null) == "UDP" && lookup(ingress_security_rules.value, "src_port", null) != null && lookup(ingress_security_rules.value, "dest_port", null) == null ? [1]: []

                content {
                    source_port_range {
                        max = lookup(ingress_security_rules.value["src_port"], "max", null)
                        min = lookup(ingress_security_rules.value["src_port"], "min", null)
                    }
                }
            }

            dynamic icmp_options {
                for_each = ingress_security_rules.value["protocol"] == "ICMP" ? [1]: []

                content {
                    type = lookup(ingress_security_rules.value["icmp_options"], "type", null)
                    code = lookup(ingress_security_rules.value["icmp_options"], "code", null)
                }
            }
        }
    }

    defined_tags = var.defined_tags
    freeform_tags = var.freeform_tags
}