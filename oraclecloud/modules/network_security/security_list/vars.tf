variable compartment_id {}
variable vcn_id {}

variable ingress_security_rules {
  default = []
}

variable egress_security_rules {
  default = []
}

variable defined_tags {
  default = {}
}

variable freeform_tags {
  default = {}
}

variable display_name {
  default = ""
}

locals {
  protocols = {
    "ICMP": "1",
    "TCP": "6",
    "UDP": "17",
    "ICMPv6": "58"
  }
}