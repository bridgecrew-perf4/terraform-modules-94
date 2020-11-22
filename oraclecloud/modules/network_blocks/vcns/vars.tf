variable parent_compartment_id {}
variable vcn_cidr_blocks {
  type = list(string)
}

variable vcn_display_name {
  default = ""
}

variable defined_tags {
  default = {}
}

variable freeform_tags {
  default = {}
}

variable vcn_dns_label {
  default = ""
}

locals {
  vcn_dns_label = var.vcn_dns_label != "" ? var.vcn_dns_label : lower(trimspace(trim(var.vcn_display_name, ".!?-/%^&*&()#$@")))
}