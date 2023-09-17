variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "name" {
  type    = string
  default = "eks"
}

variable "rtcidr" {
  type    = string
  default = "0.0.0.0/0"
}
