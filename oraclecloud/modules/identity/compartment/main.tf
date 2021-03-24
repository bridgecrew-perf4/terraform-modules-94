resource "oci_identity_compartment" compartment {
    #Required
    compartment_id = var.parent_compartment_id
    name = var.compartment_name

    #Optional
    description = local.compartment_description
    defined_tags = var.defined_tags
    freeform_tags = var.freeform_tags
}