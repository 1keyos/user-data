variable "vars" {
  type    = "map"
  default = {}
}

variable "enabled" {
  default = true
}

variable "etcd-endpoints" {
  description = "Comma separated list of etcd endpoints"
  default     = ""
}

variable "etcd-cafile" {
  description = "Path to CA file used for TLS communication with etcd"
  default     = ""
}

variable "etcd-certfile" {
  description = "Path to certificate file used for TLS communication with etcd"
  default     = ""
}

variable "etcd-keyfile" {
  description = "Path to private key file used for TLS communication with etcd"
  default     = ""
}

variable "etcd-prefix" {
  description = "etcd prefix path to be used for flannel keys"
  default     = ""
}

variable "etcd-username" {
  description = "Username for Basic Authentication to etcd endpoints"
  default     = ""
}

variable "etcd-password" {
  description = "Password for Basic Authentication to etcd endpoints"
  default     = ""
}

variable "ip-masq" {
  description = "Install IP masquerade rules for traffic outside of flannel subnet"
  default     = ""
}

variable "subnet-file" {
  description = "Path to flannel subnet file to write out"
  default     = ""
}

variable "interface" {
  description = "Interface (name or IP) that should be used for inter-host communication"
  default     = ""
}

variable "public-ip" {
  description = ""
  default     = ""
}

variable "config" {
  description = ""
  default     = "{ \"Network\": \"10.1.0.0/16\" }"
}
