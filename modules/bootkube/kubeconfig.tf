# Generated kubeconfig
resource "local_file" "kubeconfig" {
  content  = "${data.template_file.kubeconfig.rendered}"
  filename = "${var.asset_dir}/auth/kubeconfig"
}

# Generated kubeconfig with user-context
resource "local_file" "kubeconfig-kubelet" {
  content  = "${data.template_file.kubeconfig-kubelet.rendered}"
  filename = "${var.asset_dir}/auth/kubeconfig-kubelet"
}
resource "local_file" "nodekubeconfig-kubelet" {
  content  = "${data.template_file.nodekubeconfig-kubelet.rendered}"
  filename = "${var.asset_dir}/auth/nodekubeconfig-kubelet"
}


data "template_file" "kubeconfig" {
  template = "${file("${path.module}/resources/auth/kubeconfig")}"

  vars {
    ca_cert      = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    kubelet_cert = "${base64encode(tls_locally_signed_cert.kubelet.cert_pem)}"
    kubelet_key  = "${base64encode(tls_private_key.kubelet.private_key_pem)}"
    ha_kube_ip   = "${var.ha_kube_ip}"
    api_port    = "${var.api_port}"

  }
}
data "template_file" "masterkubeconfig" {
  template = "${file("${path.module}/resources/auth/masterkubeconfig")}"

  vars {
    ca_cert      = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    kubelet_cert = "${base64encode(tls_locally_signed_cert.kubelet.cert_pem)}"
    kubelet_key  = "${base64encode(tls_private_key.kubelet.private_key_pem)}"
    api_port    = "${var.api_port}"

  }
}

data "template_file" "kubeconfig-kubelet" {
  template = "${file("${path.module}/resources/auth/kubeconfig-kubelet")}"

  vars {
    name         = "${var.cluster_name}"
    ca_cert      = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    token_id     = "${var.token_id}"
    token_secret = "${var.token_secret}"
    api_port    = "${var.api_port}"
    ha_kube_ip   = "${var.ha_kube_ip}"


  }
}
data "template_file" "nodekubeconfig-kubelet" {
  template = "${file("${path.module}/resources/auth/nodekubeconfig-kubelet")}"

  vars {
    name         = "${var.cluster_name}"
    ca_cert      = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    token_id     = "${var.token_id}"
    token_secret = "${var.token_secret}"
    ha_kube_ip   = "${var.ha_kube_ip}"
    api_port    = "${var.api_port}"

  }
}

