# create compartment
resource "oci_identity_compartment" "compartment" {
    compartment_id = var.parent_compartment_ocid
    description = var.compartment_description
    name = var.compartment_name
    enable_delete = var.compartment_enable_delete
}