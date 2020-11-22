variable subnet_cidr_block {}
variable parent_compartment_id {}
variable vcn_id {}
variable subnet_route_tables {
  type = list(string)
}

variable subnet_security_list_ids {
  type = list(string)
}

variable subnet_availability_domain {
  default = "" // regional
}

variable subnet_display_name {
  default = ""
}

variable subnet_dhcp_options {
  default = ""
}

variable subnet_prohibit_public_ip_on_vnic {
  default = true
}

variable defined_tags {
  default = []
}

variable freeform_tags {
  default = []
  value = ""
}

variable subnet_dns_label {
  default = ""
}

locals {
  subnet_dns_label = var.subnet_dns_label != "" ? var.subnet_dns_label : lower(trimspace(trim(var.subnet_display_name, ".!?-/%^&*&()#$@")))
}