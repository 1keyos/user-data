output "data" {
  value = "${module.unit.data}"
}
output "etcd_client_ca_crt" {
  value = "${tls_self_signed_cert.etcd-ca.cert_pem}"
}

output "etcd_client_crt" {
  value = "${tls_locally_signed_cert.client.cert_pem}"
}

output "etcd_client_key" {
  value = "${tls_private_key.client.private_key_pem}"
}

output "etcd_server_ca_crt" {
  value = "${tls_self_signed_cert.etcd-ca.cert_pem}"
}

output "etcd_server_crt" {
  value = "${tls_locally_signed_cert.server.cert_pem}"
}

output "etcd_server_key" {
  value = "${tls_private_key.server.private_key_pem}"
}

output "etcd_peer_ca_crt" {
  value = "${tls_self_signed_cert.etcd-ca.cert_pem}"
}
output "etcd_peer_crt" {
  value = "${tls_locally_signed_cert.peer.cert_pem}"
}

output "etcd_peer_key" {
  value = "${tls_private_key.peer.private_key_pem}"
}



