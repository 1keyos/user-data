variable "vars" {
  type    = "map"
  default = {}
}

variable "enabled" {
  default = true
}

variable "name" {
  default = ""
}

variable "data-dir" {
  default = ""
}

variable "snapshot-count" {
  default = ""
}

variable "heartbeat-interval" {
  default = ""
}

variable "election-timeout" {
  default = ""
}

variable "listen-peer-urls" {
  default = ""
}

variable "listen-client-urls" {
  default = ""
}

variable "max-snapshots" {
  default = ""
}

variable "max-wals" {
  default = ""
}

variable "cors" {
  default = ""
}

variable "initial-advertise-peer-urls" {
  default = ""
}

variable "initial-cluster" {
  default = ""
}

variable "initial-cluster-state" {
  default = ""
}

variable "initial-cluster-token" {
  default = ""
}

variable "advertise-client-urls" {
  default = ""
}

variable "discovery" {
  default = ""
}

variable "discovery-srv" {
  default = ""
}

variable "discovery-fallback" {
  default = ""
}

variable "discovery-proxy" {
  default = ""
}

variable "proxy" {
  default = ""
}

variable "proxy-failure-wait" {
  default = ""
}

variable "proxy-refresh-interval" {
  default = ""
}

variable "proxy-dial-timeout" {
  default = ""
}

variable "proxy-write-timeout" {
  default = ""
}

variable "proxy-read-timeout" {
  default = ""
}

variable "cert-file" {
  default = ""
}

variable "key-file" {
  default = ""
}

variable "client-cert-auth" {
  default = ""
}

variable "trusted-ca-file" {
  default = ""
}

variable "peer-cert-file" {
  default = ""
}

variable "peer-key-file" {
  default = ""
}

variable "peer-client-cert-auth" {
  default = ""
}

variable "peer-trusted-ca-file" {
  default = ""
}

variable "debug" {
  default = ""
}

variable "log-package-levels" {
  default = ""
}
