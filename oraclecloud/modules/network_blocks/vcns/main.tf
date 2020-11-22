resource "oci_core_vcn" vcn {
    #Required
    compartment_id = var.parent_compartment_id

    #Optional
    cidr_blocks = var.vcn_cidr_blocks
    display_name = var.vcn_display_name
    dns_label = local.vcn_dns_label

    defined_tags = var.defined_tags
    freeform_tags = var.freeform_tags
}