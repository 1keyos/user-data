variable "enabled" {
  default = true
}

variable "log-driver" {
  default = "json-file"
}

variable "content" {
  default = ""
}

variable "docker-opts" {
  default = []
  type    = "list"
}
