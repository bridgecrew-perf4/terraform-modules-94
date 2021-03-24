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
        }
    }

    dynamic "ingress_security_rules" {
        for_each = var.ingress_security_rules
        content {
            source = ingress_security_rules.value["src"]
            protocol = map(local.protocols, ingress_security_rules.value["protocol"])
            description = lookup(ingress_security_rules.value, "desc", "")
            stateless = lookup(ingress_security_rules.value, "stateless", false)
            source_type = lookup(ingress_security_rules.value, "src_type", "CIDR_BLOCK")
        }
    }

    defined_tags = var.defined_tags
    freeform_tags = var.freeform_tags
}