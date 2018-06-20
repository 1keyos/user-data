provider "local" {}
locals {
  tls_dir       = "${var.custom_tls_dir == "" ? var.tiller_namespace : var.custom_tls_dir}"
  rbac_filename = "${var.tiller_namespace == "kube-system" ? "rbac-cluster.yaml" : "rbac-ns.yaml"}"
}

data "template_file" "tiller_rbac" {
  template = "${file("${format("%s/%s", "${path.module}/templates", local.rbac_filename)}")}"

  vars {
    tiller_namespace = "${var.tiller_namespace}"
    registry = "${var.registry}"
    namespace = "${var.namespace}"
    tag = "${var.tag}"

  }
}

data "template_file" "service" {
   template = "${file("${path.module}/templates/service.yaml")}"
  vars {
    tiller_namespace = "${var.tiller_namespace}"
    registry = "${var.registry}"
    namespace = "${var.namespace}"
    tag = "${var.tag}"

  }
}


data "template_file" "deployment" {
  template = "${file("${path.module}/templates/deployment.yaml")}"
  vars {
    tiller_namespace = "${var.tiller_namespace}"
    registry = "${var.registry}"
    namespace = "${var.namespace}"
    tag = "${var.tag}"

  }
}
resource "local_file" "tiller_rbac" {
    content     = "${data.template_file.tiller_rbac.rendered}"
    filename = "${var.asset_dir}/addons/helm/helm_tiller_rbac.yaml"

}
resource "local_file"  "service" {
    content     = "${data.template_file.service.rendered}"
    filename = "${var.asset_dir}/addons/helm/helm_service.yaml"
}

resource "local_file"  "deployment" {
    content     = "${data.template_file.deployment.rendered}"
    filename = "${var.asset_dir}/addons/helm/helm_deployment.yaml"


}



