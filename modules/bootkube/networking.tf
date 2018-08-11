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
    asset_dir="${var.asset_dir}"
    kube_system = "${var.kube_system}"
    network_mtu                     = "${var.network_mtu}"
    network_ip_autodetection_method = "${var.network_ip_autodetection_method}"
    pod_cidr                        = "${var.pod_cidr}"
  }
}
