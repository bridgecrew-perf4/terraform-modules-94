# terraform.oci
Multi-Cloud with modular terraform. Below are the documentations for building infrastructures: 
* with [Oracle Cloud Infrastructure](https://registry.terraform.io/providers/hashicorp/oci/latest/docs). 
* with [Azure Cloud](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

### Getting Started
1. Clone the repository, then depending on which cloud, run the following:
```bash
#########
# Oracle
#########
cd oraclecloud &&
echo 'tenancy_ocid = ""
user_ocid = ""
fingerprint = "" 
private_key_path = ""
region = ""
root_compartment = ""' > terraform.tfvars

#########
# Azure
#########
```
2. fill out the following variables in the `terraform.tfvars`

### Directory Structure
```
oraclecloud
| modules - my terraform modules (subnets, VCNs)
| recipes - different modules.tf files building different things
azurecloud
| modules
| recipes
```

### Continued Learning
For any continued learning and diving deeper into Infrastructure as Code (IaC), 
you have the following links from Terraform:

* [Understand the Terraform Configuration Language [Documentation]](https://www.terraform.io/docs/configuration/index.html)