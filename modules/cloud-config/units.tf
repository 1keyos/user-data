variable "additional_units" {
  type    = "list"
  default = []
}

// Template for units
data "template_file" "units" {
  template = "${file("${path.module}/templates/units.yml")}"

  vars {
    etcd2_unit       = "${module.etcd2_unit.data}"
    flannel_unit     = "${module.flannel_unit.data}"
    additional_units = "${join("\n", var.additional_units)}"
  }
}
