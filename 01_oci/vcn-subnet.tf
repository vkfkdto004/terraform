# Create public subnet
resource "oci_core_subnet" "vcn-public-subnet" {
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = var.public_subnet_cidr

  route_table_id    = oci_core_default_route_table.defautl-route-table.id
  security_list_ids = [oci_core_default_security_list.default-security-list.id]
  display_name      = var.public_subnet_name
}
