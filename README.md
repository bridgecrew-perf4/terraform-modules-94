# terraform.oci
Oracle Cloud with modular terraform. Documentation available at [Terraform.io](https://registry.terraform.io/providers/hashicorp/oci/latest/docs).

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