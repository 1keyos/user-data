output  "kube-ca-key" {
  value  = "${var.ca_certificate == "" ? join(" ", tls_private_key.kube-ca.*.private_key_pem) : var.ca_private_key}"

}

output  "kube-ca-crt" {
  value  = "${var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate}"

}
output  "apiserver-key" {
  value  = "${tls_private_key.apiserver.private_key_pem}"

}

output  "apiserver-crt" {
  value  = "${tls_locally_signed_cert.apiserver.cert_pem}"
 
}
output  "service-account-key" {
  value  = "${tls_private_key.service-account.private_key_pem}"
  
}

output  "service-account-crt" {
  value  = "${tls_private_key.service-account.public_key_pem}"
 
}
output  "kubelet-key" {
  value  = "${tls_private_key.kubelet.private_key_pem}"

}

output  "kubelet-crt" {
  value  = "${tls_locally_signed_cert.kubelet.cert_pem}"

}
