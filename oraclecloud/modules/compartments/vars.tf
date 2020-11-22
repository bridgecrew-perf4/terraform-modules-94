variable parent_compartment_id {}
variable compartment_name {}

variable defined_tags {
  default = {}
}

variable freeform_tags {
  default = {}
}

variable compartment_description {
  default = ""
}

locals {
  compartment_description = var.compartment_description != "" ? var.compartment_description : format("Compartment: %s", var.compartment_name)
}