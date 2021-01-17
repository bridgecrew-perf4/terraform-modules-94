# terraform.oci
My Oracle Cloud with modular terraform. Documentation available at [Terraform.io](https://registry.terraform.io/providers/hashicorp/oci/latest/docs).

### Getting Started
Clone the repository, run the following and fill out the following variables in the `terraform.tfvars` file:
```
cd oraclecloud &&
echo 'tenancy_ocid = ""
user_ocid = ""
fingerprint = "" 
private_key_path = ""
region = ""' > terraform.tfvars
```

### Directory Structure
```
oraclecloud
| modules - my terraform modules (subnets, VCNs)
| recipes - different modules.tf files buildin different things
```

### Continued Learning
For any continued learning and diving deeper into Infrastructure as Code (IaC), 
you have the following links from Terraform to help you:

* [Understand the Terraform Configuration Language [Documentation]](https://www.terraform.io/docs/configuration/index.html)