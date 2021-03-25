module "simple_compartment" {
  source = "../modules/identity/compartment"
  compartment_name = "simple_compartment"
  parent_compartment_id = ""
}

module "simple_vcn" {
  source = "../modules/core/vcns"
  parent_compartment_id = module.simple_compartment.id
  vcn_cidr_block = "10.0.0.0/16"
  vcn_dns_label = "simplevcn"
  vcn_display_name = "simplevcn"
}

module "security_list" {
  source = "../modules/core/security_list"

  compartment_id = module.simple_compartment.id
  vcn_id = module.simple_vcn.id
  ingress_security_rules = [
    {src: "0.0.0.0/0", protocol: "TCP", dest_port: {min: 22, max: 22}, desc: "SSH Access"}
  ]
}

module "simple_subnet" {
  depends_on = [module.security_list]
  source = "../modules/core/subnets"
  parent_compartment_id = module.simple_compartment.id
  subnet_cidr_block = "10.0.1.0/24"
  vcn_id = module.simple_vcn.id
  subnet_security_list_ids = [module.security_list.id]
}

