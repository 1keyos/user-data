variable "vars" {
  type    = "map"
  default = {}
}

variable "version" {
  default = "1.4.6"
}

variable "aci" {
  default = "quay.io/coreos/hyperkube"
}
