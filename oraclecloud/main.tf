module root_cloudnative {
  source = "./modules/compartments"
  parent_compartment_id = var.tenancy_ocid
  compartment_name = "ROOT_CLOUDNATIVE"
}