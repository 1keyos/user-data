variable "path" {}

variable "permissions" {
  default = "0644"
}
variable "encoding" {
    default="base64"
}
variable "owner" {
  default = "root"
}

variable "content" {
  default = ""
}
