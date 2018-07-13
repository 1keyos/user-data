# Assets generated only when certain options are chosen

resource "template_dir" "catalog-manifests" {
  source_dir      = "${path.module}/resources/addons/catalog/"
  destination_dir = "${var.asset_dir}/addons/catalog/"


  vars {
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  kube_system = "${var.kube_system}"
  }
}

