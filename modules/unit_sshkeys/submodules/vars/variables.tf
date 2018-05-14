variable "vars" {
  type    = "map"
  default = {}
}

variable "authorized-keys" {
  default = "https://raw.githubusercontent.com/freeletics/demo-ssh_keys/master/authorized_keys"
}

variable "sync-minutes" {
  default = 5
}
