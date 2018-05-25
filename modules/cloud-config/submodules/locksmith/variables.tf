variable "vars" {
  type    = "map"
  default = {}
}

variable "enabled" {
  default = true
}

variable "endpoint" {
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

variable "group" {
  description = "Name of the reboot group in which this instance belongs"
  default     = ""
}

variable "window-start" {
  description = "Start time of the reboot window"
  default     = ""
}

variable "window-length" {
  description = "Name of the reboot group in which this instance belongs"
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

variable "reboot-strategy" {
  description = "Password for Basic Authentication to etcd endpoints"
  default     = ""
}

