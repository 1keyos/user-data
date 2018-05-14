output "etcd2_server_cert-filename" {
  value = "${var.etcd2_server_cert-filename}"
}

output "etcd2_server_key-filename" {
  value = "${var.etcd2_server_key-filename}"
}

output "client_key" {
  sensitive = true
  value     = "${tls_private_key.client_key.private_key_pem}"
}

output "discovery-srv" {
  value = "${var.discovery-srv}"
}

output "etcd2_server_key" {
  value = ["${tls_private_key.etcd2_server_key.*.private_key_pem}"]
}

output "user_data" {
  value = ["${data.template_file.userdata.*.rendered}"]
}

output "node_names" {
  value = ["${data.template_file.node_names.*.rendered}"]
}
