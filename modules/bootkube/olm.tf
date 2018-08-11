# Assets generated only when certain options are chosen

resource "template_dir" "olm-manifests" {
  source_dir      = "${path.module}/resources/addons/olm"
  destination_dir = "${var.asset_dir}/addons/olm/"


  vars {
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  kube_system = "${var.kube_system}"
  }
}

