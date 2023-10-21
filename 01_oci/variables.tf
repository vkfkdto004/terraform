# Provider
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "region" {}

# Compartment
variable "parent_compartment_ocid" {}
variable "compartment_description" {}
variable "compartment_name" {}
variable "compartment_enable_delete" { default = false }

# VCN
variable "vcn_name" {}
variable "vcn_cidr" {}
variable "public_subnet_name" {}
variable "public_subnet_cidr" {}
