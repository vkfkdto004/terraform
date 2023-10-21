# Provider
# $처리 되어있는것은 값에 맞게 넣어주면됨
tenancy_ocid = "$TF_VAR_tenancy_ocid"
user_ocid = "$TF_VAR_user_ocid"
private_key_path = "TF_VAR_private_key_path"
fingerprint = "$TF_VAR_fingerprint"
region = "$TF_VAR_region"

# Compartment
parent_compartment_ocid = "$TF_VAR_parent_compartment_ocid" # 어느 compartment 밑에 넣을것인지 지정을 하면된다.
compartment_name = "MyCompartment"
compartment_description = "MyCompartment for IaC HOL"
compartment_enable_delete = true # terraform code로 지울수 있도록 설정

# VCN
vcn_name = "MyVCN"
vcn_cidr = "10.0.0.0/16"
public_subnet_name = "public-subnet"
public_subnet_cidr = "10.0.0.0/24"