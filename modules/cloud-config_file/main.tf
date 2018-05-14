data "template_file" "file" {
  template = "${file("${path.module}/template.yml")}"

  vars {
    path        = "${var.path}"
    permissions = "${var.permissions}"
    owner       = "${var.owner}"
    content     = "${var.content}"
    encoding    = "{var.encoding}"
  }
}
