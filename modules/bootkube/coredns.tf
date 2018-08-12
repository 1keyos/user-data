resource "template_dir" "coredns" {
  source_dir      = "${path.module}/resources/coredns"
  destination_dir = "${var.asset_dir}/addons/coredns"

  vars {
      registry = "${var.registry}"
      namespace = "${var.namespace}"
      tag = "${var.tag}"
    kube_system = "${var.kube_system}"
    endpoints = "${var.endpoints}"
    service_cidr          = "${var.service_cidr}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    cluster_dns_service_ip   = "${cidrhost(var.service_cidr, 10)}"
 }
}
