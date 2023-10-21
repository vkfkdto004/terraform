# 테라폼이 수행하기 위해 결과를 어떤 것을 보여줄지 정의하는 것
# Compartment OCID
output "compartment-ocid" {
    description = "Compartment OCID"
    value = oci_identity_compartment.compartment.id
}

# VCN ID
output "vcn-id" {
  description = "OCID of the VCN that is created"
  value = oci_core_vcn.vcn.id
}