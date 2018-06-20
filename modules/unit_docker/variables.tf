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
variable "registry" {
   type = "string"
   default     = "117.25.155.104:5000"

}
variable "namespace" {
   type  = "string"
   default = "port"  
}
variable "tag" {
   type  = "string"
   default ="latest"

}

