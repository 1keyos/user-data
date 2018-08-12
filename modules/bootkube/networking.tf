# Assets generated only when certain options are chosen

resource "template_dir" "flannel-manifests" {
  count           = "${contains(var.networking,"flannel") ? 1 : 0}"
  source_dir      = "${path.module}/resources/flannel"
  destination_dir = "${var.asset_dir}/addons/manifests-flannel"

  vars {
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  kube_system = "${var.kube_system}"
  pod_cidr = "${var.pod_cidr}"
  }
}

resource "template_dir" "calico-manifests" {
  count           = "${contains(var.networking , "calico" ) ? 1 :0}"
  source_dir      = "${path.module}/resources/calico"
  destination_dir = "${var.asset_dir}/addons/manifests-calico"

  vars {
    registry = "${var.registry}"
    namespace = "${var.namespace}"
    tag = "${var.tag}"
    endpoints = "${join(",", formatlist("https://%s:${var.etcdport}", var.ip_etcd_servers))}"
    asset_dir= "${var.asset_dir}"
    kube_system = "${var.kube_system}"
    network_mtu                     = "${var.network_mtu}"
    network_ip_autodetection_method = "${var.network_ip_autodetection_method}"
    ipv4                           = "${var.IPV4}"
    ipv6                           = "${var.IPV6}"
    ipv4_ip                        = "${var.IPV4 ? "- name: IP" : ""}"
    ipv4_ipvalue                   = "${var.IPV4 ? "  value: \"autodetect\"" : ""}"
    ipv4_ipip                      = "${var.IPV4 ? "- name: \"CALICO_IPV4POOL_IPIP\"" : ""}"
    ipv4_ipipvalue                 = "${var.IPV4 ? "  value: \"Always\"" : ""}"
    ipv4_cidr                      = "${var.IPV4 ? "- name: CALICO_IPV4POOL_CIDR" : ""}"
    ipv4_cidrvalue                 = "${var.IPV4 ? "  value: ${var.pod_cidr}" : ""}"
    ipv6_ip                        = "${var.IPV6 ? "- name: IP6" : ""}"
    ipv6_ipvalue                   = "${var.IPV6 ? "  value: \"autodetect\"" : ""}"
    ipv6_cidr                      = "${var.IPV6 ? "- name: CALICO_IPV6POOL_CIDR" : ""}"
    ipv6_cidrvalue                 = "${var.IPV6 ? "  value: ${var.ipv6_pod_cidr}" : ""}"

  }
}
