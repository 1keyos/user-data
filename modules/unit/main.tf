data "template_file" "unit" {
  template = "${file("${path.module}/template.yml")}"

  vars {
    name     = "${var.name}"
    type     = "${var.type}"
    enabled  = "${var.enabled}"
    drop-ins = "${var.drop-ins}"
    content  = "${var.content}"
  }
}
