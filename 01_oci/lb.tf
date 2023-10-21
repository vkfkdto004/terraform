resource "oci_load_balancer" "lb" {
  shape          = "100Mbps"
  compartment_id = var.parent_compartment_ocid

  subnet_ids = [oci_core_subnet.id]

  display_name = "lb"
}
