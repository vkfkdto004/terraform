resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = var.vcn_name
}

# Default dhcp options
resource "oci_ocre_default_dhcp_options" "default-dhcp-options" {
  manage_default_resource_id = oci_core_vcn.vnc.oci_ocre_default_dhcp_options_id

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

# Create internet gateway to allow public internet traffic
resource "oci_core_internet_gateway" "internet-gateway" {
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = "Internet Gateway"
  vcn_id         = oci_core_vcn.vcn.id
}

# Default route table
resource "oci_core_default_route_table" "default-route-table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.internet-gateway.id
  }
}

# Default security list
resource "oci_core_default_security_list" "default-security-list" {
  manage_default_resource_id = oci_core_vcn.vcn.default_security_list_id

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
    tcp_options {
      min = 80
      max = 80
    }
  }

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
    tcp_options {
      min = 443
      max = 443
    }
  }
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "6"
    tcp_options {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    source    = "0.0.0.0/0"
    protocol  = 1
    stateless = true
    icmp_options {
      type = 3
      code = 4
    }
  }
}
