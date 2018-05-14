resource "tls_private_key" "etcd2_server_key" {
  algorithm = "ECDSA"
  count     = "${var.count}"
}

resource "tls_private_key" "client_key" {
  algorithm = "ECDSA"
}
