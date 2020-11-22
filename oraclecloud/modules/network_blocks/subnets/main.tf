resource "oci_core_subnet" subnet {
    #Required
    cidr_block = var.subnet_cidr_block
    compartment_id = var.parent_compartment_id
    vcn_id = var.vcn_id

    #Optional
    availability_domain = var.subnet_availability_domain
    dhcp_options_id = var.subnet_dhcp_options
    display_name = var.subnet_display_name
    dns_label = local.subnet_dns_label
    prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
    route_table_id = var.subnet_route_tables
    security_list_ids = var.subnet_security_list_ids

    defined_tags = var.defined_tags
    freeform_tags = var.freeform_tags
}