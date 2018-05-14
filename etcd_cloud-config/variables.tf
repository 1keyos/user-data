variable "count" {
  description = "Default etcd cluster size"
  default     = 3
}

variable "discovery-srv" {
  description = "Domain name used for etcd discovery"
}

variable "organization" {
  description = "Organisation name"
}

variable "public_key" {
  description = "SSH Public Key"
}

variable "reboot_strategy" {
  description = "CoreOS reboot strategy"
  default     = "best-effort"
}

variable "additional_units" {
  type    = "list"
  default = []
}

variable "etcd2_ca-filename" {
  default = "/etc/ssl/etcd/ca_cert.pem"
}

variable "etcd2_ca-content" {}

variable "etcd2_server_cert-filename" {
  default = "/etc/ssl/etcd/server.pem"
}

variable "etcd2_server_cert-content" {}

variable "etcd2_server_key-filename" {
  default = "/etc/ssl/etcd/server.key"
}

variable "etcd2_server_key-content" {}

variable "etcd2_peer_cert-filename" {
  default = "/etc/ssl/etcd/peer.pem"
}

variable "etcd2_peer_cert-content" {}

variable "etcd2_peer_key-filename" {
  default = "/etc/ssl/etcd/peer.key"
}

variable "etcd2_peer_key-content" {}

variable "sshkeys_vars" {
  type    = "map"
  default = {}
}

variable "docker-opts" {
  default = []
  type    = "list"
}
