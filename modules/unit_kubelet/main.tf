data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
    cloud_provider        = "${var.cloud_provider}"
    cloud_provider_config = "${var.cloud_provider_config != "" ? "--cloud-config=/etc/kubernetes/cloud/config" : ""}"
    cluster_dns_ip        = "${var.kube_dns_service_ip}"
    cni_bin_dir_flag      = "${var.kubelet_cni_bin_dir != "" ? "--cni-bin-dir=${var.kubelet_cni_bin_dir}" : ""}"
    kubeconfig_fetch_cmd  = "${var.kubeconfig_fetch_cmd != "" ? "ExecStartPre=${var.kubeconfig_fetch_cmd}" : ""}"
    node_label            = "${var.kubelet_node_label}"
    node_taints_param     = "${var.kubelet_node_taints != "" ? "--register-with-taints=${var.kubelet_node_taints}" : ""}"
    k8s-version    = "${var.k8s-version}"
    k8s-aci        = "${var.k8s-aci}"
    cluster-domain = "${var.cluster-domain}"
    registry = "${var.registry}"
    namespace = "${var.namespace}"
    tag = "${var.tag}"

  }
}
data "template_file" "kubeconfig-kubelet" {
  template = "${file("${path.module}/templates/kubeconfig-kubelet")}"

  vars = {
    api_port  =   "${var.api_port}"
    ca_cert      = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    kubelet_cert = "${base64encode(tls_locally_signed_cert.kubelet.cert_pem)}"
    kubelet_key  = "${base64encode(tls_private_key.kubelet.private_key_pem)}"
  }
}
data "template_file" "kubeconfig" {
  template = "${file("${path.module}/templates/kubeconfig")}"

  vars = {
    api_port  =   "${var.api_port}"
    ca_cert      = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    kubelet_cert = "${base64encode(tls_locally_signed_cert.kubelet.cert_pem)}"
    kubelet_key  = "${base64encode(tls_private_key.kubelet.private_key_pem)}"


  }

}



module "unit" {
  source = "../unit"

  name    = "kubelet"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
