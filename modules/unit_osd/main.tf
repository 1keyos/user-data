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
  }
}

module "unit" {
  source = "../unit"

  name    = "kubelet"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
