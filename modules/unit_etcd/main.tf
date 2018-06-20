data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
  }
}
data  "template_file" "etcdstart" {
  template = "${file("${path.module}/templates/etcd-start")}"

  vars = {
    asset_dir  = "${var.asset_dir}"
    etcd_image = "${var.registry}/${var.namespace}/etcd:${var.tag}"
  }
}
data  "template_file" "updateendpoints" {
  template = "${file("${path.module}/templates/updateendpoints")}"

  vars = {
    asset_dir  = "${var.asset_dir}"

  }
}
data  "template_file"  "endpointstoml" {
  template = "${file("${path.module}/templates/endpoints.toml")}"

  vars = {
  }

}
data  "template_file"  "endpointstmpl" {
  template = "${file("${path.module}/templates/endpoints.tmpl")}"

  vars = {
     etcdip = "${var.etcdip}"
     etcd_name = "${var.etcd_name}"
  }

}


data  "template_file"  "endpoints" {
  template = "${file("${path.module}/templates/endpoints.conf")}"

  vars = {
     etcdip = "${var.etcdip}"
     etcdpeersport = "${var.etcdpeersport}"
     etcdport  =  "${var.etcdport}"
     etcd_name = "${var.etcd_name}"
  }

}

module "unit" {
  source = "../unit"

  name    = "etcd"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
